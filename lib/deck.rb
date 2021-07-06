class Deck

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    sorted = []
    @cards.each do |card|
      if card.category == category
        sorted << card
      end
    end
    return sorted
  end
  
end
