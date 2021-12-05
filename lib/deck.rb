class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

#  def category
#    @cards.category
#  end

  def cards_in_category(category)
    card_order = []
    @cards.each do |card|
      if category == card.category
        card_order << card
      end
    end
    return card_order
  end
end
