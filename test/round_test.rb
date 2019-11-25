require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

 def test_it_exists
   round = Round.new(@deck)
# require "pry"; binding.pry
   assert_instance_of Round, round
 end

 def test_it_has_no_turns
   round = Round.new(@deck)

   assert_equal [], round.turns
 end

 def test_for_current_card
   round = Round.new(@deck)

   assert_equal @card_1, round.current_card
 end

 def test_to_take_a_turn
   # require "pry"; binding.pry

    # assert_equal @turns, @round.take_turn("Juneau")
    # assert_instance_of Turn, @round.take_turn("Juneau")
    assert_instance_of Turn, @round.take_turn("Juneau")
 end
end
