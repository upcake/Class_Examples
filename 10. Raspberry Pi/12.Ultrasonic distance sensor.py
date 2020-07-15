import RPi.GPIO as GPIO
import time

trig = 7
echo = 11

GPIO.setmode(GPIO.BOARD)
GPIO.setup(echo, GPIO.IN)
GPIO.setup(trig, GPIO.OUT)
GPIO.output(trig, GPIO.LOW)

def distance_check():
    GPIO.output(trig, GPIO.HIGH)
    time.sleep(0.00001)
    GPIO.output(trig, GPIO.LOW)
    
    stop = 0
    start = 0
    
    while GPIO.input(echo) == GPIO.LOW:
        start = time.time()
    while GPIO.input(echo) == GPIO.HIGH:
        stop = time.time()
    duration = stop -start
    distance = (duration * 340 * 100)/2
    
    return distance

try:
    while True:
        result_distance = distance_check()
        print("distance = %.2fcm"%(result_distance))
        time.sleep(1)

except KeyboardInterrupt:
    GPIO.cleanup()