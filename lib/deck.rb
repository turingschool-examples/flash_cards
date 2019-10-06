class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    temp_array = []
    @cards.each do |card|
      if category == card.category
        temp_array << card
      end
    end
    temp_array
  end

end
