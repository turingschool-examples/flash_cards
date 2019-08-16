class Deck

  attr_reader :cards
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
        return_array.push(card)
      end
    end
    return return_array
  end

end
