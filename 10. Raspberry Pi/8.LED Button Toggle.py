import RPi.GPIO as GPIO

led_pin = 7
pushButton_pin = 11

GPIO.setmode(GPIO.BOARD)
GPIO.setup(led_pin, GPIO.OUT)
GPIO.setup(pushButton_pin, GPIO.IN)
           
try:
    led_on = False
    btnState = 0 #버튼의 현재 상태
    while True:
            a = GPIO.input(pushButton_pin)
            if a == 1: #버튼이 눌렸을 때
                if btnState == 0: #기존 버튼 상태가 0
                    led_on = not led_on
                    print(led_on)
                    btnState = 1
            else:
                btnState = 0
            
            GPIO.output(led_pin, led_on)
except KeyboardInterrupt:
    GPIO.cleanup()
