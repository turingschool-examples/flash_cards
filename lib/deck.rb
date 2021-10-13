class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    cards.find_all do |card|
      category == card.category
    end
  end

  def categories
    cards.map do |card|
      card.category
    end.uniq
  end
end
