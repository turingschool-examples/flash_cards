require './lib/card'
require './lib/turn'
require 'pry'
class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def cards_in_category(category_match)
    cards.select {|card| card.category == category_match}
  end

end #end class
