require './lib/card'

class Deck
  attr_reader :cards, :cat_card_array
  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def cards_in_category(cat)
    cat_card_array = []
    cards.each do |card_number|
      if card_number.category == cat
        cat_card_array << card_number
      end

    end
    cat_card_array

  end
end
