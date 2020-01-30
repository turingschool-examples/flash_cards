class Deck
  attr_reader :cards, :category

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count #size or length wojuld be better
  end

  def cards_in_category(category)
    @cards.select { |card| card.category == category }
  end
end
