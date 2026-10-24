"""
PYTHON LECTURE 4
if, if-else and elif, with railway ticket examples
"""


# ============================================================
# 1. ELIF (check several conditions, one after another)
# ============================================================

# Python checks from the top and runs the FIRST block that is True,
# then skips the rest. else runs only if nothing above matched.

# Find the smallest of four numbers
a = 10
b = 20
c = 25
d = 5
if a < b and a < c and a < d:
    print("a is smallest")
elif b < a and b < c and b < d:
    print("b is smallest")
elif c < a and c < b and c < d:
    print("c is smallest")
else:
    print("d is smallest")           # d is smallest


# ============================================================
# 2. IF ONLY
# ============================================================

passenger_name = "Joy"
ticket_status = "Confirmed"

# nothing happens if the condition is False
if ticket_status == "Confirmed":
    print("Ticket is confirmed")


# ============================================================
# 3. IF-ELSE
# ============================================================

waiting_list = 3
if waiting_list == 0:
    print("Ticket Confirmed")
else:
    print("Ticket not Confirmed")


# ============================================================
# 4. IF-ELIF-ELSE
# ============================================================

ticket_status = "RAC"
if ticket_status == "RAC":
    print("In RAC please wait . . . .")
elif ticket_status == "Confirmed":
    print("Your Ticket is Confirmed, have a Great Journey !!!!")
else:
    print("In waiting, your number is", waiting_list)


# ============================================================
# 5. CONDITIONS WITH AND / OR
# ============================================================

# Senior citizen benefits: age only
age = 58
if age >= 60:
    print("Passenger is Eligible for Senior citizen benefits")
else:
    print("Not eligible for Benefits")

# Senior citizen benefits: age AND confirmed ticket
age = 65
is_ticket_confirmed = True
if age > 60 and is_ticket_confirmed == True:
    print("Eligible for Senior citizen Benefits")
else:
    print("Not eligible")

# elif with two conditions combined using and
ticket_status = "Confirmed"
payment_status = "None"
if ticket_status == "Confirmed" and payment_status == "Paid":
    print("Ticket is Booked")
elif ticket_status == "Confirmed" and payment_status == "None":
    print("Please complete the Payment")
elif ticket_status == "None" and payment_status == "Paid":
    print("Please Confirm the Ticket")
else:
    print("Please Complete the Process")
