"""
PYTHON LECTURE 7
Lists: creating, indexing, slicing, updating, methods
"""


# ============================================================
# 1. CREATING A LIST
# ============================================================

# A list stores multiple values in one variable. It uses square brackets [].
list_1 = [1, 2, 3, 4, 5]
print(list_1)                    # [1, 2, 3, 4, 5]

list_2 = ["a", "b", "c"]
print(list_2)                    # ['a', 'b', 'c']

# A list can hold a list inside it (a nested list)
list_3 = [1, 2, 3, 4, ['a', 'b', 'c']]
print(list_3)                    # [1, 2, 3, 4, ['a', 'b', 'c']]

print(type(list_3))              # <class 'list'>


# ============================================================
# 2. INDEXING (accessing one value)
# ============================================================

# Indexing starts from 0: the first value is index 0, the second is 1, and so on.
data = [1, 2, 34, 55, 6, 7, 4, 3, 222, 565, 90]

print(data[2])                   # 34    (3rd value)
print(data[-2])                  # 565   (negative index counts from the END: -1 is the last)


# ============================================================
# 3. SLICING (accessing a part of the list)
# ============================================================

# list[start:end] -> includes start, EXCLUDES end
num = [12, 34, 43, 24, 56, 76, 55, 87]

print(num[2:5])                  # [43, 24, 56]                  index 2, 3, 4
print(num[3:])                   # [24, 56, 76, 55, 87]          from index 3 to the end
print(num[:6])                   # [12, 34, 43, 24, 56, 76]      from the start up to index 5


# ============================================================
# 4. UPDATING A VALUE
# ============================================================

# Lists are mutable: you can change them after creating them.
data = [23, 35, 67, 89, 56]
data[3] = 100
print(data)                      # [23, 35, 67, 100, 56]


# ============================================================
# 5. LIST METHODS
# ============================================================

# 5.1 append(): add ONE value at the end
data = [22, 33, 45, 67, 87, 92, 34]
data.append(400)
print(data)                      # [22, 33, 45, 67, 87, 92, 34, 400]

# 5.2 extend(): add MULTIPLE values at the end
data = [22, 33, 45, 67, 87, 92, 34]
data.extend([20, 30, 40])
print(data)                      # [22, 33, 45, 67, 87, 92, 34, 20, 30, 40]

# append vs extend: append([20, 30]) would add the whole list as ONE item.

# 5.3 insert(index, value): add a value at a position (in the middle)
data = [22, 33, 45, 67, 87, 92, 34]
data.insert(4, 1)
print(data)                      # [22, 33, 45, 67, 1, 87, 92, 34]

# 5.4 pop(index): remove the value at an index (also returns it)
data = [22, 33, 45, 67, 87, 92, 34]
data.pop(3)
print(data)                      # [22, 33, 45, 87, 92, 34]
# pop() with no index removes the LAST value.

# 5.5 remove(value): remove the first matching VALUE (not an index)
data = [22, 33, 45, 67, 87, 92, 34]
data.remove(45)
print(data)                      # [22, 33, 67, 87, 92, 34]

# 5.6 index(value): position of a value
data = [22, 33, 45, 67, 87, 92, 34]
print(data.index(67))            # 3

# 5.7 count(value): how many times a value appears
data = [22, 33, 45, 67, 87, 92, 33, 34]
print(data.count(33))            # 2

# 5.8 sort(): sort in ascending order (smallest to largest)
data = [22, 33, 45, 67, 87, 92, 34]
data.sort()
print(data)                      # [22, 33, 34, 45, 67, 87, 92]
# data.sort(reverse=True) sorts from largest to smallest.

# 5.9 reverse(): flip the order of the list
data = [22, 33, 45, 67, 87, 92, 34]
data.reverse()
print(data)                      # [34, 92, 87, 67, 45, 33, 22]

# 5.10 copy(): make a separate copy of the list
data = [22, 33, 45, 67, 87, 92, 34]
data1 = data.copy()
print(data1)                     # [22, 33, 45, 67, 87, 92, 34]

# 5.11 clear(): remove everything, leaving an empty list
data = [22, 33, 45, 67, 87, 92, 34]
data.clear()
print(data)                      # []

# Methods like append, sort, reverse change the list itself and return None.
# So  data = data.sort()  would make data equal to None. Just write  data.sort().


# ============================================================
# 6. BUILT-IN FUNCTIONS FOR LISTS
# ============================================================

data = [22, 33, 45, 67, 87, 92, 34]
print(len(data))                 # 7     number of values
print(sum(data))                 # 380   total of all values
print(min(data))                 # 22    smallest value
print(max(data))                 # 92    largest value
