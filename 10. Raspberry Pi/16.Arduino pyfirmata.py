import RPi.GPIO as GPIO
import time
import sys

# 라이브러리 경로 추가
sys.path.append('/home/pi/pyFirmata')
import pyfirmata

# 아두이노에 잡힌 포트 번호
board = pyfirmata.Arduino('/dev/ttyACM0')

# 아두이노에 꽂은 포트를 알려줌
# d : digital / a : analog
# 9 : 9번 포트
# o : OUTPUT / i : INPUT / p : PWM (value가 0 ~ 1)
pin9 = board.get_pin('d:9:o')

try:
    while True:
        pin9.write(1)
        time.sleep(1) #여긴 단위가 초(second)이다.
        pin9.write(0)
        time.sleep(1) #따라서 1초임
        
except KeyboardInterrupt:
    GPIO.cleanup()