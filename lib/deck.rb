class Deck
  attr_reader :cards

  def initialize(card)
    @cards = card
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    @cards.select { |key| key.category == category }
  end
end
