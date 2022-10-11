require './lib/card'

class Deck
  
  attr_reader :cards
  
  def initialize(cards)
    @cards = cards
    @category
  end

  def count
    @cards.length
  end
end