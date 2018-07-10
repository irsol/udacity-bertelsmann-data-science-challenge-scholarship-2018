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


