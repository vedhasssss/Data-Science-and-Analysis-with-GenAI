"""
PYTHON LECTURE 9 (PART 2)
Sets
"""

# A set:
#   - holds UNIQUE items only (duplicates are removed automatically)
#   - has no order (so you can't use an index like data[0])
#   - is mutable (you can add and remove items)
#   - is faster than a list for checking "is this item in here?"
# Because a set has no order, the printed order can differ each time you run it.


# ============================================================
# 1. CREATING A SET
# ============================================================

# Empty set: use set(). Careful: {} on its own creates an empty DICTIONARY.
data = set()
print(data)                      # set()
print(type(data))                # <class 'set'>

# Set with values: curly brackets
data = {12, 34, 54, 32, 19}
print(data)

# Duplicates disappear automatically
print({1, 2, 2, 3, 3, 3})        # {1, 2, 3}


# ============================================================
# 2. ADDING ITEMS
# ============================================================

# add(): one item
data.add(100)
print(data)

# update(): several items at once
data.update([200, 300, 400])
print(data)


# ============================================================
# 3. REMOVING ITEMS
# ============================================================

# remove(): removes the item, but CRASHES with KeyError if it isn't there
data.remove(54)
print(data)

# discard(): removes the item, and does NOTHING if it isn't there (the safer option)
data.discard(54)                 # 54 is already gone, no error
print(data)

# pop(): removes ONE item, but you can't know which one (sets have no order)
data.pop()
print(data)

# clear(): removes everything
data.clear()
print(data)                      # set()
