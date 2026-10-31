"""
PYTHON LECTURE 10
Tuples
"""

# A tuple is like a list, but IMMUTABLE: once created, it can't be changed.
# Duplicates are allowed, and the order is kept (so indexing works: a[0]).


# ============================================================
# 1. CREATING A TUPLE
# ============================================================

a = 56
print(type(a))                   # <class 'int'>     just a number, not a tuple

# A single-item tuple needs a COMMA after the item
a = 56,
print(type(a))                   # <class 'tuple'>

# Normal way: round brackets
a = (1, 2, 3, 4, 5, 6, 77, 77, 88, 88)
print(type(a))                   # <class 'tuple'>

# The brackets are optional, the commas are what make it a tuple
b = 23, 44, 55, 66, 77, 77, 88
print(type(b))                   # <class 'tuple'>


# ============================================================
# 2. IMMUTABLE: CAN'T BE CHANGED
# ============================================================

print(a[0])                      # 1     reading works
# a[0] = 100                     # TypeError: 'tuple' object does not support item assignment
# a.append(5)                    # AttributeError: tuples have no append()


# ============================================================
# 3. CONCATENATION (joining two tuples makes a NEW tuple)
# ============================================================

tuple1 = (54, 65, 87)
tuple2 = (4, 5, 6)
result = tuple1 + tuple2
print(result)                    # (54, 65, 87, 4, 5, 6)


# ============================================================
# 4. count() AND index()
# ============================================================

a = (1, 2, 3, 4, 5, 6, 77, 77, 88, 88)
print(a.count(77))               # 2     how many times 77 appears
print(a.index(5))                # 4     position of 5


# ============================================================
# 5. in AND not in
# ============================================================

print(2 in a)                    # True
print(2 not in a)                # False


# ============================================================
# LIST vs TUPLE vs SET (quick summary)
# ============================================================
#   list   [1, 2, 3]   ordered, can change, duplicates allowed
#   tuple  (1, 2, 3)   ordered, CAN'T change, duplicates allowed
#   set    {1, 2, 3}   no order, can change, NO duplicates
