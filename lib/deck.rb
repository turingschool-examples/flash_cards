class Deck
  attr_reader :cards

  def initialize(card_array)
      @cards = card_array
  end

  # This method counts the number of cards in a deck
  def count
    @cards.count
  end

  def cards_in_category(card_category)
    array = []
    @cards.each do |card|
      if card.category == card_category
        array << card
      end
    end
    return array
  end
end
