class Deck
  require 'pry'
  require './lib/turn'
  require './lib/card'

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end
  def count
    cards.size
  end
  def cards_in_category(category)
      cards.each do |card|
        if card.category == category
            card
        end
    #still need it to return an empty array when the answer is wrong
      end
   end

end
