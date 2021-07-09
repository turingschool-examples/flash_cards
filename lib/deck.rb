class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = cards.length
  end

  def cards_in_category(cat)
    @cards.select { |card| card.category == cat }
  end
end
