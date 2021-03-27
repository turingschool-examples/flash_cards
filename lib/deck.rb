require './lib/card'

class Deck
  attr_reader :cards,
              :count,
              :category

  def initialize(count, category)
    @cards = []
    @count = count
    @category = category
  end

  def add_card(card)
   @cards << card
  end

  def count_cards
   @count = cards.length
 end

end
