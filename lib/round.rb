require_relative 'deck.rb'
require_relative 'turn.rb'

class Round

  attr_accessor :deck, :turns
  def initialize(deck)
    @deck = deck
    @turns = []
  end

end
