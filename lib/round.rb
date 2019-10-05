class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    current_turn = Turn.new(guess, current_card)
    @turns << current_turn
    @deck.cards.shift
    current_turn
  end
end

#current_card method: do the turns_array, shovel  the first card into it (turns << Deck.shift), but will also return current card! So it will show the "current card," the one we are currently running through the rest of the program, but has also just shifted the first card/element into the empty array.

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

# make sure percentages work for fractions!!! .to_f or 0.0
