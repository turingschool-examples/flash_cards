require './card.rb'
require './turn.rb'

cards = [card1, card2]

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

end
