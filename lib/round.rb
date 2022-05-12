class Round
require 'turn'
attr_reader :deck, :turns
def initialize(deck)
  @deck = deck
  @turns = []
  @guess = 0
end
def current_card
  return deck.cards[@guess]
end

def take_turn(guess)
    turn = Turn.new(guess, deck.cards[@guess])
    @turns << turn
    @guess += 1
    return turn
end
end
