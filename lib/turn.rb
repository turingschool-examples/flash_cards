require 'card.rb'

class Turn
  attr_accessor :guess, :card
  def initialize(string, card)
    @guess = string
    @card = Card.card
  end
end
