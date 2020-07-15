import RPi.GPIO as GPIO
import time
import sys
sys.path.append('/home/pi/pyFirmata')
import pyfirmata

board = pyfirmata.Arduino('/dev/ttyACM0')
#디지털 9번 포트 PWM 제어
pin9 = board.get_pin('d:9:p')

try:
    while True:
        value = int(input("Enter Number (0 to 100) : "))
        pin9.write(value/100.0)
        
except KeyboardInterrupt:
    GPIO.cleanup()