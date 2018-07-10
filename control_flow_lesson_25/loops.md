## Loops

There are two types of loops in Python: `for` and `while`.

A for loop is used to "iterate", or do something repeatedly, over an **iterable**.

An **iterable** is an object that can return one of its elements at a time. This can include **sequence types**, such as strings, lists, and tuples, as well as **non-sequence types**, such as dictionaries and files.

Example:
```
cities = ['new york city', 'mountain view', 'chicago', 'los angeles']
for city in cities:
    print(city)
print("Done!")
```
Output: 
```
new york city
mountain view
chicago
los angeles
Done!
```

## range()

The built-in function range() is the right function to iterate over a sequence of numbers. It generates an iterator of arithmetic progressions.

Example: 
```
# Prints out the numbers 0,1,2,3,4
for x in range(5):
    print(x)
```