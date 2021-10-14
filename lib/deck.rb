require './lib/card'

class Deck
  attr_accessor :cards

  def initialize(array)
    @cards = array
  end

  def count
    @cards.length
  end

  def cards_in_category(category)
    category_array = []
    @cards.each do |card|
      if card.category == category
        category_array << card
      end
    end
    category_array
  end

end
