#버튼 한 번 누를때마다
#LED 켜지는 시간 10초씩 증가

import RPi.GPIO as GPIO
import time

led_pin = 7
pushButton_pin = 11

GPIO.setmode(GPIO.BOARD)
GPIO.setup(led_pin, GPIO.OUT)
GPIO.setup(pushButton_pin, GPIO.IN)

led_on = False #초기 LED 상태
pressed = 0 #버튼 상태 (눌림: 1, 안눌림: 0)
start_time = 0 #처음 버튼이 눌린 시간
remain_time = 0 #LED 불 남아 있는 시간

try:
    while True:
        a = GPIO.input(pushButton_pin)
        if a == 1: #버튼이 눌렸는가
            if pressed == 0: #버튼 상태가 계속 눌렸는가
                if led_on == False: #불이 꺼진 상태인가
                    remain_time = 0
                    start_time = time.time()
                    print(start_time)
                led_on = True
                remain_time = remain_time + 3
                print(remain_time)
                pressed = 1
        else:
            pressed = 0
                
        if led_on:
            GPIO.output(led_pin, True)
        else:
            GPIO.output(led_pin, False)
        #현재시간에서 (처음 시간 + 남은 시간)을 빼면
        if ((start_time + remain_time) - time.time()) <= 0:
            led_on = False
        else:
            led_on = True
                
except KeyboardInterrupt:
    GPIO.cleanup()