class Deck
attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    category_count = {}
    cards.map do |card|
      category_count[card.category] = 0
    end
    cards.each do |card|
      category_count[card.category] += 1
    end
    category_count[category]
  end
end
