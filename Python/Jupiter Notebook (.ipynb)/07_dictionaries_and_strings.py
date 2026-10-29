"""
PYTHON LECTURE 8
Dictionaries and strings
"""

# Python topics roadmap (as listed in class):
#   1. Variable           2. Operator          3. if-else / elif
#   4. for / while loop   5. List              6. Dictionary
#   7. Tuple              8. Set               9. String
#  10. Function
# This file covers 6 (Dictionary) and 9 (String).


# ============================================================
# 1. DICTIONARY
# ============================================================

# A dictionary stores data as key: value pairs, inside curly brackets {}.
my_dict = {
    "emp_id": 33,
    "Name": "Asha",
    "Age": 20,
    "Organisation": "Google"
}
print(my_dict)                   # {'emp_id': 33, 'Name': 'Asha', 'Age': 20, 'Organisation': 'Google'}
print(type(my_dict))             # <class 'dict'>

# Access a value using its KEY (not a position like in a list)
print(my_dict["Age"])            # 20


# ------------------------------------------------------------
# 1.1 Modifying a value
# ------------------------------------------------------------
my_dict["Age"] = 21
print(my_dict["Age"])            # 21

# ------------------------------------------------------------
# 1.2 Adding a new key: value
# ------------------------------------------------------------
# If the key doesn't exist, it is added. If it exists, its value is replaced.
my_dict["city"] = "Mumbai"
print(my_dict)                   # {... 'city': 'Mumbai'}

# ------------------------------------------------------------
# 1.3 Checking if a key exists (in works on KEYS)
# ------------------------------------------------------------
if "Marks" in my_dict:
    print("Marks found")
else:
    print("Marks not found")     # Marks not found

if "city" in my_dict:
    print("City found")          # City found
else:
    print("City not found")

# ------------------------------------------------------------
# 1.4 keys(), values(), items(), get()
# ------------------------------------------------------------
print(my_dict.keys())            # dict_keys(['emp_id', 'Name', 'Age', 'Organisation', 'city'])
print(my_dict.values())          # dict_values([33, 'Asha', 21, 'Google', 'Mumbai'])
print(my_dict.items())           # dict_items([('emp_id', 33), ('Name', 'Asha'), ...])  each pair is a tuple

# get(key): returns the value of a key
print(my_dict.get("Name"))       # Asha
# Difference from my_dict["Marks"]: a missing key with [] crashes with KeyError,
# but get() returns None (or a default you give, e.g. get("Marks", 0)).
print(my_dict.get("Marks"))      # None
print(my_dict.get("Marks", 0))   # 0

# (keys(), values() and items() return special "view" objects, not real lists.
#  Wrap them in list(...) if you need a list.)

# ------------------------------------------------------------
# 1.5 pop(): remove a key: value pair
# ------------------------------------------------------------
my_dict.pop("city")
print(my_dict)                   # {'emp_id': 33, 'Name': 'Asha', 'Age': 21, 'Organisation': 'Google'}

# ------------------------------------------------------------
# 1.6 Looping through a dictionary
# ------------------------------------------------------------
# A plain for loop gives you the KEYS
for i in my_dict:
    print(i, "=", my_dict[i])    # i is the key, my_dict[i] is its value

# Cleaner way: get key and value together with items()
for key, value in my_dict.items():
    print(key, "=", value)


# ============================================================
# 2. STRINGS
# ============================================================

# A string is text inside quotes. Like a list, every character has an index.
data = "Apple"
print(data)                      # Apple
print(type(data))                # <class 'str'>

print(data[2])                   # p      index 2
print(data[1:4])                 # ppl    index 1, 2, 3 (end is excluded)
print(data[3:])                  # le     from index 3 to the end
print(data[:3])                  # App    from the start up to index 2

# Strings are immutable: you can read a character but can't change it.
# data[0] = "a"  would give a TypeError.

# ------------------------------------------------------------
# 2.1 Looping through a string
# ------------------------------------------------------------
for i in data:
    print(i)                     # A, p, p, l, e (one per line)

# ------------------------------------------------------------
# 2.2 Joining strings with +
# ------------------------------------------------------------
a = "Asha"
b = "Rao"
full_name = a + " " + b          # the " " in the middle adds a space
print(full_name)                 # Asha Rao
