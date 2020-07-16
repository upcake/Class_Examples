import RPi.GPIO as GPIO
import time

table1_btn1 = 11
table1_btn2 = 13

table1_led1 = 8
table1_led2 = 10

table2_btn1 = 29
table2_btn2 = 31

table2_led1 = 36
table2_led2 = 38

GPIO.setmode(GPIO.BOARD)
GPIO.setup(table1_btn1, GPIO.IN)
GPIO.setup(table1_btn2, GPIO.IN)
GPIO.setup(table2_btn1, GPIO.IN)
GPIO.setup(table2_btn2, GPIO.IN)
GPIO.setup(table1_led1, GPIO.OUT)
GPIO.setup(table1_led2, GPIO.OUT)
GPIO.setup(table2_led1, GPIO.OUT)
GPIO.setup(table2_led2, GPIO.OUT)  

while True:
    time.sleep(0.2)
    btn11 = GPIO.input(table1_btn1)
    btn12 = GPIO.input(table1_btn2)
    btn21 = GPIO.input(table2_btn1)
    btn22 = GPIO.input(table2_btn2)

    if btn11 is 1:
        GPIO.output(table1_led1, True)
    else:
        GPIO.output(table1_led1, False)
    
    if btn12 is 1:
        GPIO.output(table1_led2, True)
    else:
        GPIO.output(table1_led2, False)

    if btn21 is 1:
        GPIO.output(table2_led1, True)
    else:
        GPIO.output(table2_led1, False)
        
    if btn22 is 1:
        GPIO.output(table2_led2, True)
    else:
        GPIO.output(table2_led2, False)