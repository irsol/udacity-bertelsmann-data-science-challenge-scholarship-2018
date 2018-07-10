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

There are tree **logical operatos**: and, or, not. The meaning of these operators is similar to their meaning in English.

**if** statements sometimes use more complicated boolean expressions for their conditions. They may contain multiple comparisons operators, logical operators, and even calculations. Examples:

```
if 18.5 <= weight / height**2 < 25:
    print("BMI is considered 'normal'")

if is_raining and is_sunny:
    print("Is there a rainbow?")

if (not unsubscribed) and (location == "USA" or location == "CAN"):
    print("send email")
```