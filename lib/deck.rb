class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    category_specific = []
    @cards.count do |card|
      if card.category == category
        category_specific << card
      else
      end
    end
    category_specific
  end
end
