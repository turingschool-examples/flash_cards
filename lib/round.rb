require_relative 'deck.rb'

class Round
  attr_accessor :deck
  def initialize(deck)
    @deck = deck
  end

end
