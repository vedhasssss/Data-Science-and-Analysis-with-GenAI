"""
PYTHON LECTURE 10 (PART 2)
Functions: defining, calling, parameters
"""

# A function is a block of code with a name. Write it once, use it many times.


# ============================================================
# 1. DEFINING AND CALLING A FUNCTION
# ============================================================

def welcome():                       # def = define the function
    print("Welcome to Functions")    # the body is indented
    print("Using Python")

welcome()                            # calling the function runs its code
welcome()                            # you can call it as many times as you like


# ============================================================
# 2. PARAMETERS (give the function some input)
# ============================================================

def add(a, b):                       # a and b are parameters
    result = a + b
    print(result)

add(12, 33)                          # 45   (12 and 33 are the arguments)
add(5, 5)                            # 10


# ============================================================
# 3. PRACTICE: BILL GENERATOR
# ============================================================

def bill(price, gst, quantity):
    total_price = quantity * price                   # price of all items
    gst_amount = total_price * gst / 100             # gst is a percentage
    print("--------------bill------------------")
    print(f"Quantity: {quantity}")
    print(f"Price per product: {price}")
    print(f"Total Product Price: {total_price}")
    print(f"GST: {gst} %")
    print(f"GST amount: {gst_amount}")
    print(f"Total Amount: {total_price + gst_amount}\n")

# one function, three different bills
bill(1200, 18, 2)
bill(1000, 20, 2)
bill(10, 12, 30)


# ============================================================
# 4. return (send a value BACK, instead of printing it)
# ============================================================

# print() only shows a value on screen. return gives the value back to the
# code that called the function, so you can store it and use it again.
def add_return(a, b):
    return a + b

total = add_return(12, 33)
print(total)                         # 45
print(total * 2)                     # 90   the result can be reused
