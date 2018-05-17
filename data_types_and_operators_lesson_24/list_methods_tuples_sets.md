# List Methods.

Python provide methods that operate on list, all this methods modify lists instead of creating a new list.

**Useful** functions for list:

1. `l.append(v)` appends value v to the end of list l.
2. `l.insert(i, v)` inserts value v at index i in list l.
3. `l.reverse()` reverses the order of the values in list l.
4. `len()` returns how many elements are in a list.
5. `max()` returns the greatest element of the list. 
6. `sorted()` returns a copy of a list in order from smallest to largest, leaving the list unchanged.


# Join Method.

`join` takes a list as an argument and returns a string consisting of the list elements joined by a separator string. `\n` is a separator for a new line between elements.
```python
new_str = "\n".join(["ann", "get", "an", "umbrella"])
print(new_str)

Output:

ann
get
an
umbrella
```
It is important to remember to separate each of the items in the list you are joining with a comma (,). Forgetting to do so will not trigger an error, but will also give you unexpected results.

# Tuples.

Tuple is a sequence of values, this values can be any type and they are indexed by integers and can be accessed by indicis. Tuples are immutable. you can't add and remove items from tuples, or sort them in place. 

They are often used to store related pieces of information (for example: latitude and longitude coordinates). Tuples also used to assign multiple variables in a compact way.

Tuple unpacking used for signing information from a tuple into multiple variables without having to access them one by one and make multiple assignments statement.
```python
dimensions = 52, 40, 100
length, width, height = dimensions # tuple unpacking
print("The dimensions are {} x {} x {}".format(length, width, height))
```
```python
tuple_a = 1, 2
tuple_b = (1, 2)

print(tuple_a == tuple_b)
print(tuple_a[1])

Output:
True #Perenthesis are optional when making tuple.
2
```

# Sets.