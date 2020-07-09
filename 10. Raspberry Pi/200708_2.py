#if
name = 'jane'
if name == 'jane':
    print("name is jane")
else :
    print("name is not jane")

age = 35
if age > 30 :
    print('more than 30')
else :
    print('less than 30')
    
a = 5
if a == 5:
    print ('True')
else:
    print ('False')

if a > 3 and a < 10:
    print ('True')
else:
    print ('False')

#elif
if a == 4:
    print ('number is 4')
elif a < 10:
    print ('number less than 10')
else:
    print ('number is something')

#while
a = 0
while a < 10:
    a = a + 1
    print (a)
    
#for
odd_number = [1, 3, 5, 7, 9, 11, 13]
for num in odd_number:
    print(num)

number = [1, 2, 3, 4, 5, 6, 7]
for num in number:
    if num % 2 == 0:
        print(num)

#range()
range(10) #0 ~ 9
range(5, 10) #5 ~ 9
range(10, 20, 2) #10, 12, 14, 16, 18

for i in range(10):
    print(i)
    
#gugudan
for x in range(2, 10):
    print("-------[" + str(x) + "dan]--------")
    for y in range(1, 10):
        print(x, " X ", y, " = ", x*y)
    print("---------------------")

#time
#sleep(second)
import time
for i in range(10):
    print(i)
    time.sleep(0.1)