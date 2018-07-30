# Print vs. Return in Functions


# this prints something, but does not return anything
def show_plus_ten(num):
    print(num + 10)


# this returns something
def add_ten(num):
    return(num + 10)

print('Calling show_plus_ten...')
return_value_1 = show_plus_ten(5)
print('Done calling')
print('This function returned: {}'.format(return_value_1))


print('\nCalling add_ten...')
return_value_2 = add_ten(10)
print('Done calling')
print('This function returned: {}'.format(return_value_2))


# Quiz: Population Density Function

def population_density(population, land_area):
    return population / land_area

# test cases for your function
test1 = population_density(10, 1)
expected_result1 = 10
print("expected result: {}, actual result: {}".format(expected_result1, test1))

test2 = population_density(864816, 121.4)
expected_result2 = 7123.6902801
print("expected result: {}, actual result: {}".format(expected_result2, test2))


# Quiz: readable_timedelta

def readable_timedelta(days):
    """
    Return a string of the number of weeks and days included in days.

    Parameters:
    days -- number of days to convert (int)

    Returns:
    string of the number of weeks and days included in days
    """

    week = days // 7
    # % to get the number of days that remain
    day = days % 7
    return "{} week(s) and {} day(s).".format(week, day)

print(readable_timedelta(6))

# Variable scope 

egg_count = 0

def buy_eggs(count):
    return count + 12  # purchase a dozen eggs

egg_count = buy_eggs(egg_count)
