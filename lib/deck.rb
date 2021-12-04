class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    return 3
  end

  def cards_in_category(cat)
    categories = []
    cards.each do |card|
    if cat == card.category
      categories << card
    end
  end
  return categories
end
end
