"""
PYTHON LECTURE 3
Operators (arithmetic, comparison, logical, membership, identity)
and your first conditions: if / else
"""


# ============================================================
# 1. ARITHMETIC OPERATORS
# ============================================================

x = 25
y = 3

print(x + y)       # 28                  Addition
print(x - y)       # 22                  Subtraction
print(x * y)       # 75                  Multiplication
print(x / y)       # 8.333333333333334   Division (decimal result)
print(x // y)      # 8                   Floor division (drops the decimal part)
print(x % y)       # 1                   Modulus (the remainder)
print(2 ** 3)      # 8                   Power (2 to the power 3)


# ============================================================
# 2. COMPARISON OPERATORS (the result is always True or False)
# ============================================================

print(23 == 23)    # True     is equal to
print(23 != 23)    # False    is not equal to
print(25 > 23)     # True     greater than
print(23 < 24)     # True     less than
print(23 >= 21)    # True     greater than or equal to
print(23 >= 23)    # True
print(23 <= 21)    # False    less than or equal to

# Note: = assigns a value (x = 5), == compares two values (x == 5).


# ============================================================
# 3. LOGICAL OPERATORS (combine conditions)
# ============================================================

print(45 < 50 and 67 != 67)    # False   and: BOTH must be True
print(45 < 90 or 67 != 67)     # True    or:  at least ONE must be True
print(not 34 == 34)            # False   not: flips True/False


# ============================================================
# 4. MEMBERSHIP OPERATORS (is something inside a string/list?)
# ============================================================

name = "Asha"
print("a" in name)             # True    in
print("z" in name)             # False
print("a" not in name)         # False   not in
print("z" not in name)         # True


# ============================================================
# 5. IDENTITY OPERATORS (is it the SAME object in memory?)
# ============================================================

name1 = "Ash"
print(name is name1)           # False   is
print(name is not name1)       # True    is not

# is vs ==:
#   ==  checks if two values are EQUAL      -> use this to compare values
#   is  checks if two names point to the SAME object in memory
a = [1, 2, 3]
b = [1, 2, 3]
print(a == b)                  # True   same values
print(a is b)                  # False  two different lists in memory


# ============================================================
# 6. IF-ELSE
# ============================================================

# Python uses INDENTATION (4 spaces) to mark what is inside the if/else.

# Voting eligibility
#   age = int(input("Enter your Age: "))
age = 20
if age >= 18:
    print("Eligible")
else:
    print("Not Eligible")


# ============================================================
# 7. IF WITH AND / OR
# ============================================================

# and: both conditions must be True
#   age = int(input("Enter your age: "))
age = 30
ticket = True
if age >= 25 and ticket == True:
    print("Passenger is eligible")
else:
    print("Not Eligible")

# or: only one of the two needs to be True
#   gender = input("Enter Gender [M/F]: ")
gender = "F"
if gender == "F" or ticket == True:
    print("Passenger is Eligible")
else:
    print("Not eligible")
