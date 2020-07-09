#function
#no return
def MySum1():
    a = 10
    b = 20
    print (a+b)

MySum1()

#yes return
def MySum2():
    a = 10
    b = 20
    return (a+b)
print (MySum2())

#yes parameter
def MySum3(a, b):
    return (a + b)
print(MySum3(20, 30))
print(MySum3("aaa", "AAA"))

#global variable
a = 100
def MySum4(b):
    global a
    a = 200
    return (a + b)
print(MySum4(300))

#import modulename as alias
#import time
#import RPi.GPIO as GPIO
#import math
#import random

#Save Python file as ~~~~~~.py >> ~~~~~~ : module name
#can call > ~~~~~~.variable / ~~~~~~.function