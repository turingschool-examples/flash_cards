class Deck
  attr_reader :cards, :category_array
  def initialize(cards)
    @cards = cards
    @category_array = []
  end
  def count
    @cards.size
  end
  def cards_in_category(category)
    cards.each do |card|
      if card.category == category
        @category_array << card
      end
    end
    return @category_array
  end
end
