# Functions

**Functions** are useful chunks of code that allow you to encapsulate a task. 
**Encapsulation** is a way to carrry out a whole series of steps with one command.

Functions are used to help organize and optimize code.

# Defining function

When you define a function you specify the name and the sequence of statements.

this function calculates the volume of a cylinder. The formula for this is the cylender's height, multiplied by the square of it's radius multiplied by pi.
```
def cylinder_volume(height, radius):  # function header # (height, radius) are arguments
    pi = 3.14159  # body of the function
    return height * pi * radius ** 2

cylinder_volume(10, 3)  # function call statement
```

**Function Header**
The function header, which is the first line of a function definition.

1. The function header always starts with the `def` keyword, which indicates that this is a function definition.
2.Then comes the function name (here, `cylinder_volume`), which follows the same naming conventions as variables. You can revisit the naming conventions below.
3. Immediately after the name are parentheses that may include arguments separated by commas (here, height and radius). Arguments, or parameters, are values that are passed in as inputs when the function is called, and are used in the function body. If a function doesn't take arguments, these parentheses are left empty.
4. The header always end with a colon `:`.


**Function Body**
The rest of the function is contained in the body, which is where the function does its work.

1. The body of a function is the code indented after the header line. Here, it's the two lines that define `pi` and `return` the volume.
2. Within this body, we can refer to the argument variables and define new variables, which can only be used within these indented lines.
3. The body will often include a return statement, which is used to send back an output value from the function to the statement that called the function. A return statement consists of the return keyword followed by an expression that is evaluated to get the output value for the function. If there is no return statement, the function simply returns `None`.

`Print` provides output o the console while `Return` provides the value hat you can store and work with and code later. 


## Default Arguments

Default arguments allow functions to use default values when those arguments are omitted.

We can add default arguments in a function to have default values for parameters that are unspecified in a function call.

```
def cylinder_volume(height, radius=5):
    pi = 3.14159
    return height * pi * radius ** 2

cylinder_volume(10)  # radius is default avlue in argument
cylinder_volume(10, 7)  # pass in arguments by position, overwrite the default value of 5.
cylinder_volume(height=10, radius=7)  # pass in arguments by name
```

## Variable scope

**Variable scope** the parts of a program that a variable can be referenced, or used, from.
If variable is created inside a function, it can only be used within that function. Accessing it outside that function is not possible. 

```
# This will result in an error
def some_function():
    word = "hello"

print(word)
```

`word` is said to have scope that is only local to each function. This means you can use the same name for different variables that are used in different functions.
```
# This works fine
def some_function():
    word = "hello"

def another_function():
    word = "goodbye"
```

We can define a variable outside the function and it can still be accessed within a function.

```
word = "hello"

def some_function():
    print(word)

some_function()
```

**Scope** is essential to understand how info is passed throughout programms in any languges.

## Documentation

**Docstring** a type of comment used to explain the purpose of a function and how it should be used.
Docstring are sussounded by triple quotes. 
  [PEP 257 -- Docstring Conventions](https://www.python.org/dev/peps/pep-0257/)


## Lambda Expressions

In Python, you can use **lambda expressions** to create anonymous functions. That's a function that don't have a name. They're helpful to create quick functions that aren't really needed later in your code.
sIf you want to specify multiple arguments in a **lambda function**, include them before the colomn, separate by commas.

```
def multiply(x, y):
    return x * y
``` 
With a lambda expression:

```
multiply = lambda x, y: x * y
```

Both of these functions are used in the same way. In either case, we can call multiply like this:
`multiply(4, 7)`

**Components of a Lambda Function*
1. The `lambda` keyword is used to indicate that this is a lambda expression.
2. Following lambda are one or more arguments for the anonymous function separated by commas, followed by a colon :. Similar to functions, the way the arguments are named in a lambda expression is arbitrary.
3. Last is an expression that is evaluated and returned in this function.

With this structure, lambda expressions aren’t ideal for complex functions, but can be very useful for short, simple functions.

#### Quiz: Lambda with Map
`map()` is a higher-order built-in function that takes a function and iterable as inputs, and returns an iterator that applies the function to each element of the iterable. The code below uses map() to find the mean of each list in numbers to create the list averages. Test run it to see what happens.

Rewrite this code to be more concise by replacing the mean function with a lambda expression defined within the call to `map()`.

```
numbers = [
              [34, 63, 88, 71, 29],
              [90, 78, 51, 27, 45],
              [63, 37, 85, 46, 22],
              [51, 22, 34, 11, 18]
           ]

def mean(num_list):
    return sum(num_list) / len(num_list)

averages = list(map(mean, numbers))
print(averages)
```

#### Lambda with Filter
`filter()` is a higher-order built-in function that takes a function and iterable as inputs and returns an iterator with the elements from the iterable for which the function returns True.

[More about map(), filter()](https://www.programiz.com/python-programming/anonymous-function)


## Iterators and Generators

**Iterables** are objects that can return one of it's elements at a time. List is one of the common iterables. Many of the built-in functions we’ve used so far, like 'enumerate,' return an iterator.

**An iterator** is an object that represents a stream of data. This is different from a list, which is also an iterable, but not an iterator because it is not a stream of data.

**Generators** are a simple way to create iterators using functions. It's not only way to create iterator. You can also define iterators using classes, which you can read more about [here](https://docs.python.org/3/tutorial/classes.html#iterators)

Here is an example of a generator function called my_range, which produces an iterator that is a stream of numbers from 0 to (x - 1).
```
def my_range(x):
    i = 0
    while i < x:
        yield i
        i += 1

# since this returns an iterator, we can convert it to a list or iterate through it in a loop to view 
# its  contents. For example, this code:

for x in my_range(5):
    print(x)
```
Output:
```
0
1
2
3
4
```

Notice that instead of using the return keyword, it uses `yield`. This allows the function to return values one at a time, and start where it left off each time it’s called. This `yield` keyword is what differentiates a generator from a typical function.

