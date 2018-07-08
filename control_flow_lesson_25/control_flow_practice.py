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
