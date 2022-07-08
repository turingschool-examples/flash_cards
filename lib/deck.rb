require 'pry' ; require './lib/card'

class Deck
  attr_accessor :cards_as_array, :count

  def initialize(cards_as_array)
    @cards_as_array = cards_as_array
    @count = cards_as_array.count
  end

  def cards_in_category(specified_category)
    @cards_as_array.select {|card| specified_category == card.category}
  end

end
