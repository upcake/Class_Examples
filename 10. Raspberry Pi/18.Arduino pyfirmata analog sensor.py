import RPi.GPIO as GPIO
import time
import sys
sys.path.append('/home/pi/pyFirmata')
import pyfirmata

led_pin = 11;

GPIO.setmode(GPIO.BOARD)
GPIO.setup(led_pin, GPIO.OUT, initial=GPIO.LOW)

board = pyfirmata.Arduino('/dev/ttyACM0')
pinA0 = board.get_pin('a:0:i')

#아날로그 값 받는 방식
it = pyfirmata.util.Iterator(board)
it.start()
pinA0.enable_reporting()

try:
    while True:
        # 핀 값을 읽는다
        coValue = pinA0.read()
        print(coValue)
        # 값이 아예 넘어오지 않을 수 있기 때문에
        if (coValue != None) and (coValue > 0.24):
            GPIO.output(led_pin, True)
        else:
            GPIO.output(led_pin, False)
            
        time.sleep(1)
        
except KeyboardInterrupt:
    GPIO.cleanup()
    