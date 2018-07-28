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

## Iterating Through Dictionaries with For Loops

When you iterate through a dictionary using a for loop, doing it the normal way (for n in some_dict) will only give you access to the keys in the dictionary - which is what you'd want in some situations. In other cases, you'd want to iterate through both the keys and values in the dictionary. Let's see how this is done in an example. Consider this dictionary that uses names of actors as keys and their characters as values.

```
cast = {
           "Jerry Seinfeld": "Jerry Seinfeld",
           "Julia Louis-Dreyfus": "Elaine Benes",
           "Jason Alexander": "George Costanza",
           "Michael Richards": "Cosmo Kramer"
       }
for key in cast:
    print(key)
```
The output:
```
Jerry Seinfeld
Julia Louis-Dreyfus
Jason Alexander
Michael Richards
```

The method ***items()** returns a list of dict's (key, value) tuple pairs. 
```
cast = {
           "Jerry Seinfeld": "Jerry Seinfeld",
           "Julia Louis-Dreyfus": "Elaine Benes",
           "Jason Alexander": "George Costanza",
           "Michael Richards": "Cosmo Kramer"
       }

for key, value in cast.items():
    print("Actor: {}    Role: {}".format(key, value))
```

The output:
```
Actor: Jerry Seinfeld    Role: Jerry Seinfeld
Actor: Julia Louis-Dreyfus    Role: Elaine Benes
Actor: Jason Alexander    Role: George Costanza
Actor: Michael Richards    Role: Cosmo Kramer
```
Example:
```
cast = {
           "Jerry Seinfeld": "Jerry Seinfeld",
           "Julia Louis-Dreyfus": "Elaine Benes",
           "Jason Alexander": "George Costanza",
           "Michael Richards": "Cosmo Kramer"
       }

print("Iterating through keys:")
for key in cast:
    print(key)

print("\nIterating through keys and values:")
for key, value in cast.items():
    print("Actor: {}    Role: {}".format(key, value))
```
The output:
```
Iterating through keys:
Jason Alexander
Michael Richards
Jerry Seinfeld
Julia Louis-Dreyfus

Iterating through keys and values:
Actor: Jason Alexander    Role: George Costanza
Actor: Michael Richards    Role: Cosmo Kramer
Actor: Jerry Seinfeld    Role: Jerry Seinfeld
Actor: Julia Louis-Dreyfus    Role: Elaine Benes
```

## **zip** and **enumerate**

`zip` is a built-in function, returns an iterator that combines multiple iterables into one sequence of tuples. A tuple is a sequence of values. The values can be any type and they're indexed by integers. Tuples are immutable.
For example:

`list(zip(['a', 'b', 'c'], [1, 2, 3]))` would output: `[('a', 1), ('b', 2), ('c', 3)]`

Like we did for range() we need to convert it to a list or iterate through it with a loop to see the elements.

You could unpack each tuple in a for loop like this.
```
letters = ['a', 'b', 'c']
nums = [1, 2, 3]

for letter, num in zip(letters, nums):
    print("{}: {}".format(letter, num))
```

To unzip a list into tuples using an asterisk:
```
some_list = [('a', 1), ('b', 2), ('c', 3)]
letters, nums = zip(*some_list)
```

# enumerate

`enumerate()` a built-in function, returns a list of pairs or enumerate object. The first element of each pair is an index and the second is the sequence's value at that index.

Example:

```
letters = ['a', 'b', 'c', 'd', 'e']
for i, letter in enumerate(letters):
    print(i, letter)
```

Output: 

```
0 a
1 b
2 c
3 d
4 e
```

## List comprehensions

List comprehension is an easy way to define and create lists based on existing lists.

List comprehensions can identify when it receives a string or a tuple and work on it like a list.

You want to separate the letters of the word hand and add the letters as items of a list.
Example with for loop:

```
h_letters = []

for letter in 'hand':
    h_letters.append(letter)

print(h_letters)
```

List comprehensions:

```
h_letters = [ letter for letter in 'hand' ]
print( h_letters)
```
**Syntax of List Comprehension**
`[expression for item in list]` => `letter for letter in 'human'`


### Conditionals in List Comprehension

We will create list that uses mathematical operators, integers, and range().

```
number_list = [ x for x in range(20) if x % 2 == 0]
print(number_list)
```
Output:
`[0, 2, 4, 6, 8, 10, 12, 14, 16, 18]`
The list ,number_list, will be populated by the items in range from 0-19 if the item's value is divisible by 2.

`squares = [x**2 for x in range(9) if x % 2 == 0]`
The code above sets squares equal to the list [0, 4, 16, 36, 64], as x to the power of 2 is only evaluated if x is even.

If you would like to add else, you have to move the conditionals to the beginning of the listcomp, right after the expression, like this.
`squares = [x**2 if x % 2 == 0 else x + 3 for x in range(9)]`
List comprehensions are not found in other languages, but are very common in python.