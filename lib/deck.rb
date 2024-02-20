
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards

  end

  def count 
    @cards.length
  end

  def cards_in_category(cat)
    matches = @cards.select { |card| card.category == cat}
  end 
end 
