class Deck
  attr_reader :cards

  def initialize(cards)
    @deck = []
    @cards = cards
  
  end
  def count
    @cards.count
  end
end
