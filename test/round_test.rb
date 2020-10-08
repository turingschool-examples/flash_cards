require 'minitest/autorun'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < MiniTest::Test

  # Constants

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
    "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
    "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end


  # Corrects
  










  # Incorrects







end
