"""
PYTHON LECTURE 6
Loop control: break, continue, pass
plus practice examples (odd/even, railway seats, sum of numbers)
"""


# ============================================================
# 1. BREAK (stop the loop completely)
# ============================================================

for i in range(0, 10):
    if i == 6:
        break                    # leave the loop as soon as i is 6
    else:
        print(i)                 # 0 1 2 3 4 5


# ============================================================
# 2. CONTINUE (skip this round, go to the next one)
# ============================================================

# Skip the number 10
for i in range(1, 20):
    if i == 10:
        continue                 # jump straight to the next i
    print(i)                     # 1 ... 9, 11 ... 19

# NOTE: in class this was written as "next", but next is NOT how Python skips
# a round. next is a built-in function name, and writing it alone does nothing.
# The code only worked by accident because of the else. Use continue.


# ============================================================
# 3. ODD AND EVEN NUMBERS
# ============================================================

# x % 2 gives the remainder after dividing by 2: 0 means even, 1 means odd

# Odd numbers with a for loop (skip the even ones)
for i in range(1, 10):
    if i % 2 == 0:
        continue
    print(i)                     # 1 3 5 7 9

print("--------------------------")

# Even numbers with a for loop
for i in range(1, 10):
    if i % 2 == 0:
        print(i)                 # 2 4 6 8

print("--------------------------")

# Even numbers with a while loop
i = 0
while i < 11:
    if i % 2 == 0:
        print(i)                 # 0 2 4 6 8 10
    i = i + 1

print("--------------------------")

# Odd numbers with a while loop
i = 0
while i < 11:
    if i % 2 != 0:
        print(i)                 # 1 3 5 7 9
    i = i + 1

# With while + continue you must increase i BEFORE continue, or the loop
# gets stuck forever on the same number.


# ============================================================
# 4. PASS (do nothing, a placeholder)
# ============================================================

# Python doesn't allow an empty block, so pass fills the gap.
# Useful while you are still planning the code.
for i in range(3):
    pass                         # nothing happens


# ============================================================
# 5. PRACTICE: RAILWAY BOOKING
# ============================================================

total_seats = 5
for booking in range(1, 10):
    if booking > total_seats:
        print("No more seats available")
        break                                    # stop booking
    elif booking == 3:
        print("Checking Special reservation")
        continue                                 # skip the "booked" message for seat 3
    print("Seat", booking, "is booked Successfully")

# Output: seats 1, 2 booked, seat 3 checked, seats 4, 5 booked, then "No more seats"


# ============================================================
# 6. PRACTICE: BOOK ONLY EVEN SEATS
# ============================================================

total_seats = 13
for booking in range(1, 20):
    if booking % 2 == 0:
        print(booking, "seat booked")
    elif booking == total_seats:
        print("No seat Available ahead")
        break

# Even seats 2 to 12 are booked. Odd seats are skipped, until the odd seat 13 stops the loop.


# ============================================================
# 7. PRACTICE: SUM OF NUMBERS (1 + 2 + 3 + ... + 10)
# ============================================================

total = 0
for i in range(0, 11):
    total = total + i            # add each number to the running total
print(total)                     # 55
