#datetime은 날짜 가져오기

import datetime
import time
import picamera
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)
GPIO.setup(11, GPIO.IN, GPIO.PUD_UP)

try:
    while True:
        with picamera.PiCamera() as camera:
            camera.start_preview()
            
            #버튼이 눌릴 때를 기다림
            GPIO.wait_for_edge(11, GPIO.FALLING) #녹화 시작
            ntime = datetime.datetime.now()
            print(ntime)
            camera.start_recording('/home/pi/Videos/' + str(ntime) + '.h264')
            time.sleep(1)
            
            GPIO.wait_for_edge(11, GPIO.FALLING) #녹화 종료
            camera.stop_recording()
            
            camera.stop_preview()
            camera.close()
            #Ctrl + C를 누르고 버튼을 눌러야 종료된다.
except KeyboardInterrupt:
    GPIO.cleanup()
