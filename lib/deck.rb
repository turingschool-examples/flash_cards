class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def size
    @cards.count
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    return nil unless @cards.each { |card| card.category == category}

    @cards.select { |card| card.category == category }
  end
end
