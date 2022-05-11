class Deck

  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = cards.length
  end

  def cards_in_category(category)
    
    return_array = []

    cards.each do |card|
      if card.category == category
        return_array << card
      end
    end

    return return_array
  end

end
