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

# Quiz: Break the String
#
# Write a loop with a break statement to create a string, news_ticker, that
# is exactly 140 characters long. You should create the news ticker by adding
# headlines from the headlines list, inserting a space in between each headline.

headlines = ["Local Bear Eaten by Man",
             "Legislature Announces New Laws",
             "Peasant Discovers Violence Inherent in System",
             "Cat Rescues Fireman Stuck in Tree",
             "Brave Knight Runs Away",
             "Papperbok Review: Totally Triffic"]

news_ticker = ""

headlines = " ".join(headlines)

for letter in headlines:
    news_ticker = news_ticker + letter
    if len(news_ticker) == 140:
        break

print(news_ticker)

# Udacity solution

headlines = ["Local Bear Eaten by Man",
             "Legislature Announces New Laws",
             "Peasant Discovers Violence Inherent in System",
             "Cat Rescues Fireman Stuck in Tree",
             "Brave Knight Runs Away",
             "Papperbok Review: Totally Triffic"]

news_ticker = ""
for headline in headlines:
    news_ticker += headline + " "
    if len(news_ticker) >= 140:
        news_ticker = news_ticker[:140]
        break

print(news_ticker)


# Quiz 1: zip() and enumerate()
#
# Zip Coordinates


x_coord = [23, 53, 2, -12, 95, 103, 14, -5]
y_coord = [677, 233, 405, 433, 905, 376, 432, 445]
z_coord = [4, 16, -6, -42, 3, -6, 23, -1]
labels = ["F", "J", "A", "Q", "Y", "B", "W", "X"]

points = []

for num_x, num_y, num_z, letter in zip(x_coord, y_coord, z_coord, labels):
    points.append("{}: {}, {}, {}".format(letter, num_x, num_y, num_z))

print(points)


# Udacity solution:
x_coord = [23, 53, 2, -12, 95, 103, 14, -5]
y_coord = [677, 233, 405, 433, 905, 376, 432, 445]
z_coord = [4, 16, -6, -42, 3, -6, 23, -1]
labels = ["F", "J", "A", "Q", "Y", "B", "W", "X"]

points = []
for point in zip(labels, x_coord, y_coord, z_coord):
    points.append("{}: {}, {}, {}".format(*point))

for point in points:
    print(point)


# Quiz 2: zip() and enumerate()
#
# Zip Lists to a Dictionary

cast_names = ["Barney", "Robin", "Ted", "Lily", "Marshall"]
cast_heights = [72, 68, 72, 66, 76]

cast = dict(zip(cast_names, cast_heights)) 

print(cast)


# Quiz 3: unzip
#
# Unzip the cast tuple into two names and heights tuples.


cast = (("Barney", 72), ("Robin", 68), ("Ted", 72), ("Lily", 66), ("Marshall", 76))

# define names and heights here

names, heights = zip(*cast)

print(names)
print(heights)


# Quiz 4: zip() and enumerate()
#
# Quiz: Transpose with Zip
# Use zip to transpose data from a 4-by-3 matrix to a 3-by-4 matrix

data = ((0, 1, 2), (3, 4, 5), (6, 7, 8), (9, 10, 11))

data_transpose = tuple(zip(*data))

print(data_transpose)


# Quiz 5: Quiz: Enumerate
#
# Use enumerate to modify the cast list so that each element contains the name
# followed by the character's corresponding height. For example, the first
# element of cast should change from "Barney Stinson" to "Barney Stinson 72".

cast = ["Barney Stinson", "Robin Scherbatsky", "Ted Mosby", "Lily Aldrin", "Marshall Eriksen"]
heights = [72, 68, 72, 66, 76]

for index, height in enumerate(heights):
    s = "{} {}".format(cast[index], height)
    cast[index] = s

print(cast)

