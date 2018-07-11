# Quiz 1: Create Usernames

#Write a for loop that iterates over the names list to create a usernames list.
#To create a username for each name, make everything lowercase and replace
#spaces with underscores. Running your for loop over the list.


names = ["Joey Tribbiani", "Monica Geller", "Chandler Bing", "Phoebe Buffay"]
usernames = []

for name in names:
    name = name.lower()
    name = name.replace(' ', '_')
    usernames.append(name)
    
    # or shorter variant:
    # usernames.append(name.lower().replace(' ', '_'))

print(usernames)


# Quiz 2: Modify Usernames with Range
# Write a for loop that uses range() to iterate over the positions in usernames
# to modify the list. Like you did in the previous quiz, change each name to be
# lowercase and replace spaces with underscores.

usernames = ["Joey Tribbiani", "Monica Geller", "Chandler Bing",
             "Phoebe Buffay"]

for index in range(len(usernames)):
    usernames[index] = usernames[index].lower().replace(' ', '_')
print(usernames)


# Quiz 3: Tag Counter
# Write a for loop that iterates over a list of strings, tokens, and counts how
# many of them are XML tags. XML is a data language similar to HTML. You can
# tell if a string is an XML tag if it begins with a left angle bracket "<" and
# ends with a right angle bracket ">". Keep track of the number of tags using
# the variable count.

tokens = ['<greeting>', 'Hello World!', '</greeting>']
count = 0

for token in tokens:
    if token[0] == '<' and token[-1] == '>':
        count = count + 1
    
print(count)


# Quiz 4: Create an HTML List
# Write some code, including a for loop, that iterates over a list of strings
# and creates a single string, html_str, which is an HTML list. For example,
# should output:
# <ul>
# <li>first string</li>
# <li>second string</li>
# </ul>

items = ['first string', 'second string']
html_str = "<ul>\n"  # "\ n" is the character that marks the end of the line,
                     # it does the characters that are after it in html_str
                     # are on the next line

for item in items:
    html_str = html_str + "<li>" + str(item) + "</li>" "\n"

html_str = html_str + "</ul>"

print(html_str)


# Quiz 5: Lower
# If you want to create a new list called lower_colors, where each color
# in colors is lower cased, which code would do this?

colors = ['Red', 'Blue', 'Green', 'Purple']
lower_colors = []

for color in colors:
    lower_colors.append(color.lower())

print(lower_colors)


# Quizzes: Iterating Through Dictionaries

# Quiz 1: Fruit Basket - Task 1
"""
You would like to count the number of fruits in your basket. In order to do
this, you have the following dictionary and list of fruits. Use the dictionary
and list to count the total number of fruits, but you do not want to count the
other items in your basket.
"""

result = 0
basket_items = {'apples': 4, 'oranges': 19, 'kites': 3, 'sandwiches': 8}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

#Iterate through the dictionary
for key, value in basket_items.items():
    for item in fruits:
        #if the key is in the list of fruits, add the value (number of fruits)
        #to result
        if item == key:
            result = result + value

print(result)


# Quiz: Fruit Basket - Task 2
"""
If your solution is robust, you should be able to use it with any dictionary of
items to count the number of fruits in the basket. Try the loop for each of
the dictionaries below to make sure it always works.
"""

#Example 1

result = 0
basket_items = {'pears': 5, 'grapes': 19, 'kites': 3, 'sandwiches': 8, 'bananas': 4}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here

for key, value in basket_items.items():
    for item in fruits:
        
        #if the key is in the list of fruits, add the value (number of fruits) 
        #to result
        if item == key:
            result = result + value

print(result)

#Example 2

result = 0
basket_items = {'peaches': 5, 'lettuce': 2, 'kites': 3, 'sandwiches': 8, 'pears': 4}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here

for key, value in basket_items.items():
    for item in fruits:
        
        #if the key is in the list of fruits, add the value (number of fruits)
        #to result
        if item == key:
            result = result + value

print(result)

#Example 3

result = 0
basket_items = {'lettuce': 2, 'kites': 3, 'sandwiches': 8, 'pears': 4, 'bears': 10}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

# Your previous solution here

for key, value in basket_items.items():
    for item in fruits:
        #if the key is in the list of fruits, add the value (number of fruits)
        #to result
        if item == key:
            result = result + value

print("I count {} fruits in the busket".format(result)


# Quiz: Fruit Basket - Task 3

# You would like to count the number of fruits in your basket. 
# In order to do this, you have the following dictionary and list of
# fruits.  Use the dictionary and list to count the total number
# of fruits and not_fruits.

fruit_count, not_fruit_count = 0, 0
basket_items = {'apples': 4, 'oranges': 19, 'kites': 3, 'sandwiches': 8}
fruits = ['apples', 'oranges', 'pears', 'peaches', 'grapes', 'bananas']

#Iterate through the dictionary
for key, value in basket_items.items():

    #if the key is in the list of fruits, add to fruit_count.
    if key in fruits:
        fruit_count = fruit_count + value

    #if the key is not in the list, then add to the not_fruit_count
    else:
        not_fruit_count = not_fruit_count + value

print("There are {} fruits and {} not fruits".format(fruit_count, not_fruit_count))


