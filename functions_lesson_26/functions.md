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