import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BOARD)
GPIO.setup(11, GPIO.OUT, initial=GPIO.LOW)

p = GPIO.PWM(11, 100) #GPIO.PWM(핀번호 ,진동수)

p.start(0) #start(듀티비를 실수로 표시, 0% - 100%)
time.sleep(1)

p.ChangeDutyCycle(10) #듀티비 설정
time.sleep(1)

p.ChangeDutyCycle(50)
time.sleep(1)

p.ChangeDutyCycle(100)
time.sleep(1)

p.stop()
GPIO.cleanup()