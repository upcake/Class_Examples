import RPi.GPIO as GPIO
import time

GPIO.setmode(GPIO.BCM) #BCM : 확장보드의 이름대로 핀번호를 준다

GPIO.setup(4, GPIO.OUT, initial=GPIO.LOW)
#7번 핀을 OUT (출력) 목적으로 사용하며 초기 값은 LOW 상태로 시작하도록 설정함

GPIO.output(4, GPIO.HIGH)
#4번 핀에 HIGH 상태로 출력함

time.sleep(3)

GPIO.cleanup()
#GPIO핀들을 개방시켜줌, 개방시키지 않고 종료하면 다음 실행 시 경고 메시지가 표시됨