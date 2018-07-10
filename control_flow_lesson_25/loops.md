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

Notes on using `range()`:

If you specify one integer inside the parentheses withrange(), it's used as the value for 'stop,' and the defaults are used for the other two.
* e.g. - `range(4)` returns 0, 1, 2, 3
   If you specify two integers inside the parentheses withrange(), they're used for 'start' and 'stop,' and the default is used for 'step.'
* e.g. - `range(2, 6)` returns 2, 3, 4, 5
   Or you can specify all three integers for 'start', 'stop', and 'step.'
* e.g. - `range(1, 10, 2)` returns 1, 3, 5, 7, 9

* e.g. - `range(0, -5)` returns []

## Creating and Modifying Lists
You can create a list by appending to a new list at each iteration of the for loop like this:

Creating a new list:
```
cities = ['new york city', 'mountain view', 'chicago', 'los angeles']
capitalized_cities = []

for city in cities:
    capitalized_cities.append(city.title())
```

**Modifying** a list is a bit more involved, and requires the use of the range() function.

We can use the range() function to generate the indices for each value in the cities list. This lets us access the elements of the list with cities[index] so that we can modify the values in the cities list in place.
```
cities = ['new york city', 'mountain view', 'chicago', 'los angeles']

for index in range(len(cities)):
    cities[index] = cities[index].title()
```

