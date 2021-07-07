class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards

  end

  def cards_in_category(cat)
    @cards.select {|card| card.category == cat}
  end
end
