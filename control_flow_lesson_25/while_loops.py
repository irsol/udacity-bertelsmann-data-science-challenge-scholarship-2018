# while Loops

# 1.Practice: Water Falls

# Print string vertical.

print_str = "Water falls"

# initialize a counting variable "i" to 0
i = 0

# write your while header line, comparing "i" to the length of the string
while i < len(print_str):
    #print out the current character from the string
    print(print_str[i-1])

    #increment counter variable in the body of the loop
    i = i + 1

#print(print_str)


# 2.Practice: Factorials with While Loops

"""
Find the Factorial of a Number, using While Loop.

A factorial of a whole number is that number multiplied by every whole number
between itself and 1. For example, 6 factorial (written "6!")
equals 6 x 5 x 4 x 3 x 2 x 1 = 720. So 6! = 720.

We can write a while loop to take any given number, and figure out what its
factorial is.

Example: If number is 6, your code should compute and print the product of 720:
"""


number = 6
product = number

while number > 1:
    number = number - 1
    product = product * number

print(product)

