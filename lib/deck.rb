require './lib/card'
require './lib/turn'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards


  end

  def card_category(category)
    cat_array = []
    @cards.each do |card|
      if card.category == category
        cat_array << card
      end
    end
      cat_array

  end

end
