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
