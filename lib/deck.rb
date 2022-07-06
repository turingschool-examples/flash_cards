require 'pry' ; require './lib/card'

class Deck
  attr_accessor :cards_as_array

  def initialize(cards_as_array)
    @cards_as_array = cards_as_array
  end

  def cards
    @cards_as_array
  end

  def count
    @cards_as_array.count
  end

  def cards_in_category(specified_category)
    @cards_as_array.select {|card| specified_category == card.category}
  end

end

card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
cards = [card_1, card_2, card_3]
deck = Deck.new(cards)
