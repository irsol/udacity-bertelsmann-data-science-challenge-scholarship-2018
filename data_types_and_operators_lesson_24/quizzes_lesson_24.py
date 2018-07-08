# 22. Quiz: Slicing Lists

eclipse_dates = ['June 21, 2001', 'December 4, 2002', 'November 23, 2003',
                 'March 29, 2006', 'August 1, 2008', 'July 22, 2009',
                 'July 11, 2010', 'November 13, 2012', 'March 20, 2015',
                 'March 9, 2016'] 
# TODO: Modify this line so it prints the last three elements of the list
print(eclipse_dates[-3:])

# 24. Quiz: List Methods

names = ["Carol", "Albert", "Ben", "Donna"]
names.append("Eugenia")
print(sorted(names))

['Albert', 'Ben', 'Carol', 'Donna', 'Eugenia']

# 30. Quiz: Dictionaries

a = [1, 2, 3]
b = a
c = [1, 2, 3]

print(a == b)  # True
print(a is b)  # True
print(a == c)  # True
print(a is c)  # False

# 34. Quiz: Compound Data Structures

elements = {'hydrogen': {'number': 1, 'weight': 1.00794, 'symbol': 'H'},
            'helium': {'number': 2, 'weight': 4.002602, 'symbol': 'He'}}

# todo: Add an 'is_noble_gas' entry to the hydrogen and helium dictionaries
# hint: helium is a noble gas, hydrogen isn't

elements['hydrogen']['is_noble_gas'] = False
elements['helium']['is_noble_gas'] = True

print(elements['hydrogen']['is_noble_gas'])
print(elements['helium']['is_noble_gas'])

