# << Python comment

# print() : output to screen
print('Hello World')

# variables
# data type is not needed
a = 10
b = 3.5
c = 'MIKE'
live_in_seoul = True
print(a)
print(b)
print(c)
print(live_in_seoul)

# add(+)
a = 20
b = 6
sum = a + b
print(sum)
print(a + b)

# subtraction(-)
sum = a - b
print(sum)

# multiple(*)
sum = a * b
print(sum)

# square(**)
print(a ** 3)
print(b ** 4)

# division(/)
sum = a / b
print(sum)

# quotient (//)
sum = a // b
print(sum)

# remainder (%)
sum = a % b
print(sum)

# list []
names = ['mike', 'jane', 'tom']
print(names)
print(names[0]) #mike
#print(names[3]) #error

# dictionary {key : value}
#user = {'age' : 25, 'address' : 'seoul'}
user = {}
user['age'] = 25
user['address'] = 'seoul'
print(user)
print(user['age'])
print(user.get('address')) #recommend, even user doesn't have address, doesn't causing error
print(user.get('id')) #None
