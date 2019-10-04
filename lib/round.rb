# Object, processes responses and records guesses
# Initialized with a deck
# Start of Round: "current card" is first in the deck (first in Deck's array of cards)
# Guess is recorded
# Next card in deck becomes "current card"

# take_turn takes a string (the guess), creates a new Turn object with the guess and Card object
# take_turn stores this Turn (in turns array), and returns it from take_turn method
# When take_turn is used, the Round should move on to the next Card in the Deck
# turns is an instance variable in the Class, it is not a method

# .correct? is coming from Turn class
