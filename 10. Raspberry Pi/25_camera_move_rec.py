# Web streaming example
# Source code from the official PiCamera package
# http://picamera.readthedocs.io/en/latest/recipes2.html#web-streaming

import io
import picamera
import datetime
from PIL import Image
import math, operator
from functools import reduce

prior_image = None
before_rate = 0
last_rate = 0

# motion notice 
def detect_motion(camera):
    global prior_image, before_rate, last_rate
    stream = io.BytesIO()
    camera.capture(stream, format='jpeg', use_video_port=True)
    stream.seek(0)
    if prior_image is None:
        prior_image = Image.open(stream)
        return False
    else:
        current_image = Image.open(stream)
        # Compare current_image to prior_image to detect motion. This is
        # left as an exercise for the reader!
        h1 = prior_image.histogram()
        h2 = current_image.histogram()
        samerate = math.sqrt(reduce(operator.add, map(lambda a,b: (a-b)**2, h1, h2))/len(h1))
        #result = random.randint(0, 10) == 0
        print(samerate)
        last_rate = samerate
        # Once motion detection is done, make the prior image the current
        prior_image = current_image
        if samerate < 1000 or abs(last_rate-before_rate) > 1000:
            result = False
            before_rate = last_rate
        else:
            result = True
            before_rate = last_rate
            
        return result
 
def write_video(stream):
    # Write the entire content of the circular buffer to disk. No need to
    # lock the stream here as we're definitely not writing to it
    # simultaneously
    with io.open('/home/pi/CCTV/before.h264', 'wb') as output:
        for frame in stream.frames:
            if frame.header:
                stream.seek(frame.position)
                break
        while True:
            buf = stream.read1()
            if not buf:
                break
            output.write(buf)
    # Wipe the circular stream once we're done
    stream.seek(0)
    stream.truncate()
        
with picamera.PiCamera() as camera:
    camera.resolution = (640, 480)
    stream = picamera.PiCameraCircularIO(camera, seconds=10)
    camera.start_recording(stream, format='h264')
    try:
        while True:
            camera.wait_recording(0.5)
            if detect_motion(camera):
                print('Motion detected!')
                # As soon as we detect motion, split the recording to
                # record the frames "after" motion
                ntime = datetime.datetime.now()
                camera.split_recording('/home/pi/CCTV/' + str(ntime) + '.h264')
                # Write the 10 seconds "before" motion to disk as well
                write_video(stream)
                # Wait until motion is no longer detected, then split
                # recording back to the in-memory circular buffer
                while detect_motion(camera):
                    camera.wait_recording(0.5)
                print('Motion stopped!')
                camera.split_recording(stream)
    finally:
        camera.stop_recording()

