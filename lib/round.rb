require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'

class Round
  attr_reader :deck
  def initialize(deck)
    @deck = deck
  end

  def take_turn

  end

end
