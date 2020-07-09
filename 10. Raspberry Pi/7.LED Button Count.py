import RPi.GPIO as GPIO

led_pin = 7
pushButton_pin = 11

GPIO.setmode(GPIO.BOARD)
GPIO.setup(led_pin, GPIO.OUT)
GPIO.setup(pushButton_pin, GPIO.IN)
           
try:
    btnCnt = 0 #버튼이 눌린 카운트
    btnState = 0 #버튼의 현재 상태
    while True:
            a = GPIO.input(pushButton_pin)
            if a == 1: #버튼이 눌렸을 때
                GPIO.output(led_pin, True)
                if btnState == 0: #기존 버튼 상태가 0
                    btnCnt += 1
                    print(btnCnt)
                    btnState = 1
            else:
                GPIO.output(led_pin, False)
                btnState = 0

except KeyboardInterrupt:
    GPIO.cleanup()