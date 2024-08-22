class Deck

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    category_cards = @cards.find_all do |card|
    card.category == category
    end
    category_cards.length
  end
end