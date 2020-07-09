#builtin function
#upper, lower, count, swapcase
a = "Good morning, Man"
print(a.upper())
print(a.lower())
print(a.count('o'))
print(a.swapcase())

#replace
a = "Life is too short"
print(a.replace("Life", "Your height"))

#split
a = "I regret what I did to you"
print(a.split())

d = "home, mother, sweet"
print(d.split(','))
print(d.split(","))

#casting
n = int('123') #string > number
f = float("365.7") #string > float
s = str(123) #number > string
ss = str(456) + "789"
print(n)
print(f)
print(s)
print(ss)

#len
print(len("hi"))
