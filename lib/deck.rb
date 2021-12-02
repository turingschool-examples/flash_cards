class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(cat)
    cat_cards = []
    @cards.each do |card|
      cat_cards << card if card.category == cat
    end
    return cat_cards
  end
end
