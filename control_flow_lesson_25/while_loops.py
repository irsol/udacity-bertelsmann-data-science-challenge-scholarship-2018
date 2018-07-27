# while Loops

# 1.Practice: Water Falls

# Print string vertical.

print_str = "Water falls"

# initialize a counting variable "i" to 0
i = 0

# write your while header line, comparing "i" to the length of the string
while i < len(print_str):
    #print out the current character from the string
    print(print_str[i])

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




# 3.Practice: Factorials with For Loops
# Now use a For Loop to Find the Factorial!

number = 6
# We'll start with the product equal to the number
product = number

# Write a for loop that calculates the factorial of our number
for num in range(1, number):
    if num > 1:
        number = number - 1
        product = product * number

print(product)

# another solution without if statement
for num in range(1, number):
    product *= num

print(product)


# Quiz: Count by
#
# 1. Suppose you want to count from some number start_num by another number
# count_by until you hit a final number end_num. Use break_num as the variable
# that you'll change each time through the loop.

start_num = 2  # start number
end_num = 66  # end number that you stop when you hit
count_by = 3  # some number to count by

break_num = start_num
while break_num < end_num:
    break_num = break_num + count_by

print(break_num)


# 2. Now in addition, address what would happen if someone gives a start_num
# that is greater than end_num. If this is the case, set result to "Oops! Looks
# like your start value is greater than the end value. Please try again."
# Otherwise, set result to the value of break_num.

start_num = 2  # some start number
end_num = 22  # some end number that you stop when you hit
count_by = 3  # some number to count by 

# condition to check that end_num is larger than start_num before looping

if start_num > end_num:
    result = "Oops! Looks like your start value is greater than the end value. Please try again."

else:
    break_num = start_num
    while break_num < end_num:
        break_num = break_num + count_by
        result = break_num
print(result)


# 3. Write a while loop that finds the largest square number less than an
# integerlimit and stores it in a variable nearest_square

limit = 40

count = 1
nearest_square = 1

while (count + 1) ** 2 < limit:
    count = count + 1
    nearest_square = count ** 2
    #print(nearest_square) # to print all possible nearest square

print(nearest_square)

