require './lib/card'
require './lib/turn'

class Deck
  attr_reader :cards, :categories
  def initialize(cards)
    @cards = cards
    @categories = []
    cards.each do |card|
      if @categories.include?(card.category) == false
        @categories << card.category
      end
    end
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
