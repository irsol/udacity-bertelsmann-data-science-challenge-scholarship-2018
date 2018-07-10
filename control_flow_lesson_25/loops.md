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

## Built-in function **range()**

The built-in function range() is the function to iterate over a sequence of numbers. It generates an iterator of arithmetic progressions.

Example: 
```
# Prints out the numbers 0,1,2,3,4
for x in range(5):
    print(x)
```

`range()` is a built-in function used to create an iterable sequence of numbers. You will frequently use `range()` with a `for` loop to repeat an action a certain number of times, as in this example:
```
for i in range(3):
    print("Hello!")
```
**range(start=0, stop, step=1)**
The `range()` function takes three integer arguments, the first and third of which are optional:

* The 'start' argument is the first number of the sequence. If unspecified, 'start' defaults to 0.
* The 'stop' argument is 1 more than the last number of the sequence. This argument must be specified.
* The 'step' argument is the difference between each number in the sequence. If unspecified, 'step' defaults to 1.
