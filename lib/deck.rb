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

  def cards_in_category(category_)
    cards.select {|card| card.category == category_}
  end

end #end class
