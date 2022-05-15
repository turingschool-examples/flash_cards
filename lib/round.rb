# #The Round
#
# A Round will be the object that processes responses and records guesses. A Round is initialized with a Deck. The idea is that when we start a Round, the current card is the first in the deck (the first in the Deck’s array of Cards). When we make a guess, the guess is recorded, and the next card in the deck becomes the current card.
#
# The take_turn method is the crux of this problem. The take_turn method takes a string representing the guess. It should create a new Turn object with the appropriate guess and Card. It should store this new Turn, as well as return it from the take_turn method. Also, when the take_turn method is called, the Round should move on to the next card in the deck.

class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck #deck of cards for this round
    @turns = [] #initialized with empty array
    @current_card = @deck.cards[0] #initializes current card with first card of deck

  end

  # def take_turn(guess_string)
  #   #shovel guesses into turns array
  #   #should create a new turn object with guess + card, and store in new turn
  #
  #   #return new Turn
  #
  # end

end
