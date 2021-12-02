class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(category)
    @sorted_cards = @cards.select do |card|
      card.category == category
    end
  end

  def count
    @cards.size
  end
end
