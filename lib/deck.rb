class Deck
  attr_reader :cards, :category

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    @cards.select { |card| card[2] == category }
    # unfinished code?
  end
end
