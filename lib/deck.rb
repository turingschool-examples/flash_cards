class Deck
  attr_reader       :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    shelf = []
    cards.each do |card|
      if card.category == category
        shelf << card
      end
    end
    shelf
  end
end
