require './lib/card'
require './lib/turn'

class Deck
  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def cards
    @cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    count_array = []
    @cards.each { |card| count_array << card.category }
    puts count_array.count(category)
  end

end
