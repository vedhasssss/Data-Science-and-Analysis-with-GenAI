"""
PYTHON LECTURE 9
String methods and string formatting
"""

# String methods covered:
#   upper(), lower(), partition(), replace(), find(), index(),
#   strip(), split(), startswith(), isnumeric(), format() / f-strings

# Strings are immutable, so none of these change the original string.
# Each one RETURNS a new value, so print it or store it in a variable.

data = "Code with Python"


# ============================================================
# 1. upper() and lower()
# ============================================================

print(data.upper())              # CODE WITH PYTHON
print(data.lower())              # code with python


# ============================================================
# 2. partition(): split into 3 parts around the FIRST match
# ============================================================

# Returns a tuple: (part before, the match itself, part after)
print(data.partition("w"))       # ('Code ', 'w', 'ith Python')


# ============================================================
# 3. replace(old, new)
# ============================================================

print(data.replace("Python", "SQL"))     # Code with SQL


# ============================================================
# 4. index() and find(): position of a character or text
# ============================================================

print(data.index("w"))           # 5
print(data.find("C"))            # 0

# Both give the position of the FIRST match. The difference shows up
# when the text is NOT found:
print(data.find("z"))            # -1   find() returns -1
# print(data.index("z"))         # index() crashes with ValueError


# ============================================================
# 5. strip(): remove spaces from the start and end
# ============================================================

data_1 = "Asha   "
print(data_1, 10)                # Asha    10     (the spaces are still there)
print(data_1.strip(), 10)        # Asha 10        (spaces removed)

# strip()  removes spaces from BOTH ends
# lstrip() removes from the LEFT only
# rstrip() removes from the RIGHT only


# ============================================================
# 6. split(): break a string into a list
# ============================================================

data_2 = "a b c d e f g h i j k l m n o p q r s t u v w x y z"
print(data_2.split(" "))         # ['a', 'b', 'c', ... 'z']   split wherever there is a space


# ============================================================
# 7. startswith(): does the string begin with this text? (True / False)
# ============================================================

print(data.startswith("C"))      # True
print(data.startswith("w"))      # False
# endswith() works the same way for the end of the string.


# ============================================================
# 8. isnumeric(): is the string made only of digits? (True / False)
# ============================================================

num = "67"
print(num.isnumeric())           # True
print("6a".isnumeric())          # False


# ============================================================
# 9. FORMATTING STRINGS: 3 ways to put variables inside text
# ============================================================

Name = "Asha"
Age = 21
height = 5.11

# Way 1: print() with commas
print("My name is", Name, "age is", Age, "Height is", height)

# Way 2: format(), values go into the {} placeholders by position
print("My name is {0} Age is {1} Height is {2}".format(Name, Age, height))

# Way 3: f-string (put f before the quotes, write variables inside {})
# This is the newest and most readable way, so prefer it.
print(f"My name is {Name} Age is {Age} Height is {height}")
