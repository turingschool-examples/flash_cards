require './lib/card'
require './lib/turn'
require './lib/deck'


class Round

  def initialize(deck)
    @deck = deck
  end

def current_card
  @deck.cards[0]
end

def take_turn
#takes a string representing the guess, creates new take_turn
# object with the appropriate guess and Card
# stores this new turn, as well as return it from take_turn
# when called, should move to next card in deck
end


end
