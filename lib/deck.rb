require './lib/turn'
require './lib/card'

class Deck
  attr_reader :cards
    
  def initialize(cards)
    @cards = cards
  end

  def count #used to access ruby's built in #count method on the cards instance variable
    cards.count 
  end

  def cards_in_category(cat_id)
    @cards.select do |card|
      card.category == cat_id
    end
  end
end