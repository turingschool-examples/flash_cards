class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    cards = []
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    category_collect = []
    @cards.each do |card|
      category_collect << card if card.category == category
    end
    category_collect
  end
end
