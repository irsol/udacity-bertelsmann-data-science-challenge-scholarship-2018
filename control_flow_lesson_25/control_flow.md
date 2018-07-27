# Control flow

We'll learn:
* conditional statements
* **for** and **while** loop 
* exit or skip loops with **break** and **continue**
* use **built-in functions**: **zip** and **enumerate**
* list comprehensions

## **if** statement

An **if** statement is a conditional statement that runs or skips code based on whether a condition is true or false. Example:

```
if phone_balance < 5:
    phone_balance += 10
    bank_balance -= 10
```

## Comparison Operators in Conditional Statements

`=` assignment operator that assigns value on the left to the name on the right

`==` comparison operator that evaluates whether objects on both sides are equal

## **if**, **elif**, **else**

**if**: An if statement must always start with an if clause, which contains the first condition that is checked. If this evaluates to True, Python runs the code indented in this if block and then skips to the rest of the code after the if statement.

**elif**: elif is short for "else if." An elif clause is used to check for an additional condition if the conditions in the previous clauses in the if statement evaluate to False.

**else**: Last is the else clause, which must come at the end of an if statement if used. This clause doesn't require a condition. The code in an else block is run if all conditions above that in the if statement evaluate to False.

```
if season == 'spring':
    print('plant the garden!')
elif season == 'summer':
    print('water the garden!')
elif season == 'fall':
    print('harvest the garden!')
elif season == 'winter':
    print('stay indoors!')
else:
    print('unrecognized season')
```

## Indentation

In Python, indents conventionally come in multiples of four spaces. Be strict about following this convention, because changing the indentation can completely change the meaning of the code.

The [Python Style Guide](https://www.python.org/dev/peps/pep-0008/#tabs-or-spaces) recommends using 4 spaces to indent, rather than using a tab. Whichever you use, be aware that "Python 3 disallows mixing the use of tabs and spaces for indentation."

## Boolean expressions

A **boolean expression** is an expression that is either True or False.

There are tree **logical operatos**: and, or, not. Use parentheses if you need to make the combinations clear.

**if** statements sometimes use more complicated boolean expressions for their conditions. They may contain multiple comparisons operators, logical operators, and even calculations. Examples:

```
if 18.5 <= weight / height**2 < 25:
    print("BMI is considered 'normal'")

if is_raining and is_sunny:
    print("Is there a rainbow?")

if (not unsubscribed) and (location == "USA" or location == "CAN"):
    print("send email")
```

However simple or complex, the condition in an **if** statement must be a boolean expression that evaluates to either True or False and it is this value that decides whether the indented block in an if statement executes or not.

## Good and Bad Examples 

**Don't use**: `if True:` or `if False:`

Bad example:
```if True:
    print("This indented code will always get run.")
```    
While `True` is a valid boolean expression, it's not useful as a condition since it always evaluates to True, so the indented code will always get run. Similarly, if `False` is not a condition you should use either - the statement following this `if` statement would never be executed.


**Be careful** writing expression that use **logical operators**: `and`, `or`, `not`:

Bad example:
```
if weather == "snow" or "rain":
    print("Wear boots!")
```
This code is valid in Python, but it is not a boolean expression, although it reads like one. The reason is that the expression to the right of the or operator, "rain", is not a boolean expression - it's a string! Later we'll discuss what happens when you use non-boolean-type objects in place of booleans.


**Don't evaluate** the truth of a boolean variable with `== True` or `== False`:

Bad example:
This comparison isn’t necessary, since the boolean variable itself is a boolean expression.
```
if is_cold == True:
    print("The weather is cold!")
```
This is a valid condition, but we can make the code more readable by using the variable itself as the condition instead, as below.

Good example:
```
if is_cold:
    print("The weather is cold!")
```    

If you want to check whether a boolean is False, you can use the **not** operator.

## Truth Value Testing
If we use a **non-boolean object** as a condition in an if statement in place of the boolean expression, Python will check for its truth value and use that to decide whether or not to run the indented code. By default, the truth value of an object in Python is considered True unless specified as False in the documentation.

Here are most of the built-in objects that are considered False in Python:

* constants defined to be false: `None` and `False`

* zero of any numeric type: `0`, `0.0`, `0j`, `Decimal(0)`, `Fraction(0, 1)`

* empty sequences and collections: `""`, `()`, `[]`, `{}`, `set()`, `range(0)`

Example:
```
errors = 3
if errors:
    print("You have {} errors to fix!".format(errors))
else:
    print("No errors to fix!")
```
In this code, errors has the truth value True because it's a non-zero number, so the error message is printed.

## Quiz: Boolean Expressions for Conditions

Imagine an air traffic control program that tracks three variables, altitude,
speed, and propulsion which for a particular airplane have the values
specified below:
```
altitude = 10000
speed = 250
propulsion = "Propeller"
```
Expressions: 

1.`altitude < 1000 and speed > 100` 

    `altitude < 1000` is False, so we don't even need to check the second condition - the whole expression
     is False.


2.`(propulsion == "Jet" or propulsion == "Turboprop") and speed < 300 and altitude > 20000 `

    `propulsion == "Jet"` is False, and `propulsion == "Turboprop"` is False, so the whole expression inside
     the parentheses is False.


3.`not (speed > 400 and propulsion == "Propeller") `

     To work this one out, we need to look at the inside of the parentheses first, then apply not to that.
     `speed > 400` is False, and because we are using and this makes the whole of the expression inside the
      parentheses False. Applying not reverses this, so this expression is True.



4.`(altitude > 500 and speed > 100) or not propulsion == "Propeller" `

     `altitude > 500` is True, and speed is greater than 100, so the expression inside the parenthesis is True.
     Whatever the value of the other expression, because they are connected by or, the whole expression will
     evaluate to True.


# Break and Continue:

`for` loops iterate over every element in a sequence.
`while`  loops iterate until they're stopping condition is met.

`break` lterminates loop (for or while) immediately if it get a break statement.

`continue` terminates one iteration od a `for` or `while` loop.

