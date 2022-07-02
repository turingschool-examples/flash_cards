class Deck

  attr_reader :cards, :category

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    return_array = []
    @cards.each do |card|
      if card.category == category
        return_array << card
      end
    end
    return_array
  end
end
