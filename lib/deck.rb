class Deck
  attr_reader :cards, :category

  def initialize (cards)
    @cards = cards
    @category = category
  end

  def count
    cards.length
  end

  def cards_in_category(type)
    categorize = cards.select do |card|
      card.category == type
    end

  end

end
