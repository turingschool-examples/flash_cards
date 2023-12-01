class Round
  attr_reader   
  def initialize(deck)
    @deck = deck
  end
end

# when we start a Round, the current card is the first in the deck

# When we make a guess, the guess is recorded, and the next card in the deck becomes the current card.

# take_turn method is the crux
# takes a string representing the guess
#  should create a new Turn object with the appropriate guess and Card
#  should create a new Turn object with the appropriate guess and Card
#  return it from the take_turn method.
#  when the take_turn method is called, the Round should move on to the next card in the dec