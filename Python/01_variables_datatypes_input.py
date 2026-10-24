"""
PYTHON LECTURES 1 AND 2
print(), variables, data types, input() and type conversion

The file runs top to bottom without stopping. Wherever the lecture used
input(), a sample value is used instead, and the input() version is shown
in a comment so you can try it yourself.
"""


# ============================================================
# 1. PRINT AND VARIABLES
# ============================================================

print("Hello world")

# A variable stores a value. No need to declare its type, Python works it out.
name = "Asha"
age = 21

print(name)
print("Age:", age)          # print() can take several values, separated by commas


# ============================================================
# 2. DATA TYPES AND type()
# ============================================================

name = "Joy"                 # str   (text)
age = 23                     # int   (whole number)
height = 4.5                 # float (decimal number)

print("Your Name is", name)
print("Your age is", age)
print("Your height is", height)

# type() tells you the data type of a value
print(type(name))            # <class 'str'>
print(type(age))             # <class 'int'>
print(type(height))          # <class 'float'>

# bool is the 4th basic type: True or False
is_student = True
print(type(is_student))      # <class 'bool'>


# ============================================================
# 3. INPUT AND TYPE CONVERSION
# ============================================================

# input() asks the user to type something.
# IMPORTANT: input() ALWAYS gives back a string, even if the user types a number.
#
#   name = input("Enter Your Name: ")
#   age = input("Enter Your Age: ")
#   height = input("Enter Your Height: ")
#
# To do maths, convert the string first: int() for whole numbers, float() for decimals.
#
#   x = int(input("Enter 1st Number: "))
#   y = int(input("Enter 2nd Number: "))

# Sample values used here so the file can run without stopping:
x = 20
y = 4

print("Sum of two numbers:", x + y)          # 24
print("Multiplication:", x * y)              # 80
print("Division:", x / y)                    # 5.0  (/ always gives a float)

# Without int(), the input would be text and + would join it instead of adding:
print("20" + "4")                            # 204
print(int("20") + int("4"))                  # 24

# Watch out: if y is 0, x / y crashes with ZeroDivisionError.
