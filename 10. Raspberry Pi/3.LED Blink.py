import RPi.GPIO as GPIO #GPIO 모듈 불러오기
import time

GPIO.setmode(GPIO.BCM) #GPIO 옆 번호를 사용

#4 > GPIO04 => 핀번호 7번 (다음부터는 BOARED로 사용)
GPIO.setup(4, GPIO.OUT, initial = GPIO.LOW)

try:
    while (True):
        GPIO.output(4, GPIO.HIGH)
        time.sleep(0.5)
        GPIO.output(4, GPIO.LOW)
        time.sleep(0.5)

except KeyboardInterrupt: #Ctrl + C로 종료
    GPIO.cleanup()