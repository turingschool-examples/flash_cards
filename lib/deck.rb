class Deck
  require './lib/turn'
  require './lib/card'

  attr_accessor :cards, :category_array

  def initialize(cards)
    @cards = cards
    @category_array = []
  end
  def count
    @cards.size
  end
  def cards_in_category(category)
      @cards.each do |card|
        if card.category == category
            @category_array << card
        end
      end
      category_array
   end

end
