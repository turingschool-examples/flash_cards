class Deck
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.length
  end

  def cards_in_category(category)
    card_categories = []
    cards.each do |card| 
      if card.category == category
        card_categories << card
      end
    end
    return card_categories
  end
end
