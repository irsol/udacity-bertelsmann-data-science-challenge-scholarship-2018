# square_number function returns a list of squared numbers

def square_numbers(nums):
    result = []
    for i in nums:
        result.append(i * i)
    return result


my_nums = square_numbers([1, 2, 3, 4, 5])

print(my_nums)

print('\n')

# generator

"""
generator don't hold the entire result in memory it yields one result
at a time
"""

def square_numbers(nums):
    for i in nums:
        yield (i * i)

my_nums = square_numbers([1, 2, 3, 4, 5]) # my_ nums is generator

for num in my_nums:
    print(num)

print('\n')

# next(my_nums) the output is 1, the first value in a list and first
# squared number
#print next(my_nums) # 1
#print next(my_nums) # 4
#print next(my_nums) # 9
#print next(my_nums) # 16
#print next(my_nums) 25


# generator with list coprehension

my_nums = (x*x for x in [1, 2, 3, 4, 5])

for num in my_nums:
    print(num)

print('\n')

# generator, convert data in a list

my_nums = (x*x for x in [1, 2, 3, 4, 5])

print list(my_nums)