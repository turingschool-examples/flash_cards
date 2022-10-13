#initialized w/ array of Card objects.
#should also return cards based on given category

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    category_cards = []
    @cards.each do |card|
      if category == card.category
        category_cards << card
      end
    end
    return category_cards
  end

end
