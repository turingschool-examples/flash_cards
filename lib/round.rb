require './card.rb'
require './turn.rb'
require './deck.rb'

class Round
  attr_reader :deck
  def initialize(deck)
    @deck = deck
  end

  def take_turn
    
  end

end
