class Deck
  attr_reader :cards, :category_array

  def initialize(cards)
    @cards = cards
  end
  
  def count
    @cards.size
  end

  def cards_in_category(category)
    category_array = []
    cards.each do |card|
      if card.category == category
        category_array << card
      end
    end
    p category_array
  end
end
