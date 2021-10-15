class Deck
  def initialize(cards)
    @cards = cards
  end

  def cards
    @cards
  end

  def count
    cards.size
  end

  def cards_in_category(category)
    category_matches = []
    cards.each do |card|
      if card.category == category
        category_matches << card
      end
    end
    return category_matches
  end

end
