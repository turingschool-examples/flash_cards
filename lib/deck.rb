class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    cards.select do |card|
      cat if cat == card.category
    end
  end
end
