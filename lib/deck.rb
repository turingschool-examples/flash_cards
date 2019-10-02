class Deck
  require 'pry'
  require './lib/turn'
  require './lib/card'

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end
  def count
    self.cards.size
  end
  def cards_in_category(category)
      self.cards.each do |card|
       return card if card.category == category
      end
   end

end
