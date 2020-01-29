class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  

  def count_cards
    return @cards.count
  end
end
