require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
    @new_turn = @round.take_turn("Juneau")
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_turns_exist
    assert_equal  @round.turns
  end

  def test_can_call_current_card
    assert_equal @round.current_card
  end

  def test_you_can_take_another_turn
    assert_equal "Juneau", @round.take_turn("Juneau")
  end
end
