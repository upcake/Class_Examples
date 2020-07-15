#원격으로 하면 잘 되지 않는 경우가 생기므로 직접 연결 추천
#카메라 쓰기 위해 PiCamera import
from picamera import PiCamera

#시간 사용하기 위해 time에 있는 sleep 함수
from time import sleep

#카메라 변수 선언
camera = PiCamera()

#미리보기 함수
camera.start_preview()
sleep(5)

#사진 찍기 : 경로를 지정해 줌
#경로 지정 안하면 'home/pi/capture.jpg'
camera.capture('/home/pi/Pictures/capture.jpg')

#미리보기 정지
camera.stop_preview()
camera.close()