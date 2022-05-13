require 'pry'
class Round
  attr_reader :deck, :turns, :class

  def initialize(deck)
    @deck = deck
    @turns = []
    @class = Turn
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    @turn_1
  end

  def correct?
    
  end
end
