class Deck
  attr_reader :cards, :count
  def initialize(deck)
    @cards = deck
    @count = deck.count
  end

  def cards_in_category(category)
    category_array = []
    cards.each do |card|
      if card.category == category
        category_array << card.to_s
      end
    end
    category_array
  end
end
