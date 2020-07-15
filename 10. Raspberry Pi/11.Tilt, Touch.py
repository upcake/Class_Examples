import RPi.GPIO as GPIO
import time

tilt_pin = 11 #터치 센서의 경우 센서만 바꾸면 됨

GPIO.setmode(GPIO.BOARD)
GPIO.setup(tilt_pin, GPIO.IN)

try:
    while True:
        a = GPIO.input(tilt_pin)
        print(a)
        time.sleep(1)
        
except KeyboardInterrupt:
    GPIO.cleanup()