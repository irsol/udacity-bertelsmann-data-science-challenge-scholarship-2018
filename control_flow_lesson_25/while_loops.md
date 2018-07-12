## while Loops

`for` useful if you know how many iterations of the loop you need or "definite iteration". There are situations where it's impossible to know in advance
how many times will want the loop body executed ("definite iteration"). That's what a `while` loop is used for. 

`while` loops sometimes called **conditional** loops because they iterate as long as some conditions is true or end. 
Example:
```
card_deck = [4, 11, 8, 5, 13, 2, 8, 10]
hand = []

# adds the last element of the card_deck list to the hand list
# until the values in hand add up to 17 or more
while sum(hand)  < 17:
    hand.append(card_deck.pop())
``` 

## sum() and pop()

`sum()`returns the sum of the elements in a list. 

`pop()` is the opposite (or inverse) of the append method, it removes the last elemet from a list nd returns it.