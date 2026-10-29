"""
PYTHON LECTURE 5
Loops: for loop with range(), while loop
"""


# ============================================================
# 1. FOR LOOP WITH range()
# ============================================================

# A loop repeats a block of code. A for loop goes through a sequence of numbers.
# range() creates that sequence.

# range(end): starts at 0, stops BEFORE end
for i in range(10):
    print(i)                     # 0 1 2 ... 9

# range(start, end): stops BEFORE end
for i in range(10, 20):
    print(i)                     # 10 11 ... 19

# range(start, end, step): step is the gap between numbers
for i in range(0, 50, 5):
    print(i)                     # 0 5 10 ... 45


# ============================================================
# 2. PRINTING ON ONE LINE
# ============================================================

# print() adds a new line after every call. end=" | " changes what is added instead.
for i in range(1, 10):
    print(i, end=" | ")          # 1 | 2 | 3 | ... | 9 |
print()                          # empty print() moves to the next line


# ============================================================
# 3. COUNTING BACKWARDS (REVERSING)
# ============================================================

# Way 1: use a negative step
for i in range(10, 0, -1):
    print(i)                     # 10 9 8 ... 1

# Way 2: count from -10 up to -1 and print the negative of each number
for i in range(-10, 0):
    print(-i)                    # 10 9 8 ... 1


# ============================================================
# 4. WHILE LOOP
# ============================================================

# A while loop keeps repeating AS LONG AS its condition is True.
# Use it when you don't know in advance how many times to repeat.
x = 0
while x <= 100:
    print(x)                     # 0 10 20 ... 100
    x = x + 10                   # change the variable, or the loop never ends!

# for vs while:
#   for   -> you know how many times (or what to loop over)
#   while -> repeat until a condition becomes False
