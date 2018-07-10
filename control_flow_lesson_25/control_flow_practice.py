# Practice: Conditional Statement

points = 174  # use this input to make your submission

if points <= 50:
    result = "Congratulations! You won a wooden rabbit!"

elif 51 <= points <= 150:
    result = "Oh dear, no prize this time."

elif 151 <= points <= 180:
    result = "Congratulations! You won a wafer-thin mint!"

else:
    result = "Congratulations! You won a penguin!"

print(result)


# Quiz: Guess My Number

# You decide you want to play a game where you are hiding
# a number from someone.  Store this number in a variable
# called 'answer'.  Another user provides a number called
# 'guess'.  By comparing guess to answer, you inform the user
# if their guess is too high or too low.

answer = 10  # provide answer
guess = 5  # provide guess

if guess < answer:
    result = "Oops!  Your guess was too low."
elif guess > answer:
    result = "Oops!  Your guess was too high."
elif guess == answer:
    result = "Nice!  Your guess matched the answer!"

print(result)


# Quiz: Tax Purchase

# Depending on where an individual is from we need to tax them
# appropriately.  The states of CA, MN, and
# NY have taxes of 7.5%, 9.5%, and 8.9% respectively.
# Use this information to take the amount of a purchase and
# the corresponding state to assure that they are taxed by the right
# amount.

state = 'CA'  # Either CA, MN, or NY
purchase_amount = 21  # amount of purchase

if state == 'CA':
    tax_amount = .075
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

elif state == 'MN':
    tax_amount = .095
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

elif state == 'NY':
    tax_amount = .089
    total_cost = purchase_amount*(1+tax_amount)
    result = "Since you're from {}, your total cost is {}.".format(state, total_cost)

print(result)


# Quiz: Boolean Expressions for Conditions

#You will use a new variable prize to store a prize name if one was won, and
#then use the truth value of this variable to compose the result message. This
#will involve two if statements.

#1st conditional statement: update prize to the correct prize name based
#on points.
#2nd conditional statement: set result to the correct phrase based on whether
#prize is evaluated as True or False.


points = 174

# establish the default prize value to None
prize = None

# use the points value to assign prizes to the correct prize names
if points <= 50:
    prize = "wooden rabbit"
elif 151 <= points <= 180:
    prize = "wafer-thin mint"
elif 181 <= points <= 200:
    prize = "penguin"

# use the truth value of prize to assign result to the correct prize
if prize:
    result = "Congratulations! You won a {}!".format(prize)
else:
    result = "Oh dear, no prize this time."

print(result)
