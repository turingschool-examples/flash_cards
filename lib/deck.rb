class Deck
attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.size
  end

  def cards_in_category(category)
    cards_with_same_category = []
    cards.each do |card|
      cards_with_same_category << card if category == card.category
    end
    cards_with_same_category
  end
end
