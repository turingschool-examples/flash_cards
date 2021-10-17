class Deck
  attr_accessor :cards
  def initialize (cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(category)
    current_category = []
    @cards.each do|card|
        if card.category == category
        current_category << card.category
      end
    end
    current_category
  end
end
