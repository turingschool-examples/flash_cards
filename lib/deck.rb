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
    filtered_cards = [] # holds cards that meet filter criteria
    @cards.each do |card| # iterates through array of card instances held in @cards
      if card.category == cat_id # checks if the category of each card matches the cat_id parameter
        filtered_cards << card
      end
    end
    filtered_cards
  end
end