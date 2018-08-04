# Quiz: Implement my_enumerate
"""
Write your own generator function that works like the built-in function enumerate.

Calling the function like this:

lessons = ["Why Python Programming", "Data Types and Operators", "Control Flow",
           "Functions", "Scripting"]

for i, lesson in my_enumerate(lessons, 1):
    print("Lesson {}: {}".format(i, lesson))

should output:

Lesson 1: Why Python Programming
Lesson 2: Data Types and Operators
Lesson 3: Control Flow
Lesson 4: Functions
Lesson 5: Scripting
"""


lessons = ["Why Python Programming", "Data Types and Operators", "Control Flow", "Functions", "Scripting"]


def my_enumerate(iterable, start=0):
    # Implement your generator function here
    for i in range(start, len(iterable) + start):
        yield(i, iterable[i-start])
        
for i, lesson in my_enumerate(lessons, 1):
    print("Lesson {}: {}".format(i, lesson))


# print  5 lessons

lessons = ["Why Python Programming", "Data Types and Operators", "Control Flow", "Functions", "Scripting"]


def my_enumerate(iterable, start=0):
    i = start
    for num in iterable:
        yield i, num
        i += 1

for i, lesson in my_enumerate(lessons, 1):
    print("Lesson {}: {}".format(i, lesson))


# Quiz: Chunker

"""
If you have an iterable that is too large to fit in memory in full (e.g.,
when dealing with large files), being able to take and use chunks of it at a
time can be very valuable.

Implement a generator function, chunker, that takes in an iterable and yields
a chunk of a specified size at a time.

should output:

[0, 1, 2, 3]
[4, 5, 6, 7]
[8, 9, 10, 11]
[12, 13, 14, 15]
[16, 17, 18, 19]
[20, 21, 22, 23]
[24]
"""


def chunker(iterable, size):
    for i in range(0, len(iterable), size):
        index = i + size
        lst = iterable[i:index]
        yield lst


for chunk in chunker(range(25), 4):
    print(list(chunk))


# Udacity solution

def chunker(iterable, size):
    """Yield successive chunks from iterable of length size."""
    for i in range(0, len(iterable), size):
        yield iterable[i:i + size]

for chunk in chunker(range(25), 4):
    print(list(chunk))


# Generator Expressions


sq_list = [x**2 for x in range(10)]  # this produces a list of squares

sq_iterator = (x**2 for x in range(10))  # this produces an iterator of squares


