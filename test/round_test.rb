require 'minitest/autorun'
require 'minitest/pride'
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
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_turns_initialized_as_empty_array
    assert_equal [], @round.turns
  end

  def test_current_card_returns_card_1
    assert_equal @card_1, @round.current_card
  end

  def test_new_turn_creates_a_turn
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
    assert new_turn.correct?
    assert @round.turns.include?(new_turn)
  end

  def test_take_turn_advances_card
    new_turn = @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  # test_take_turn_feedback
  # test_turn_counters
  # test_turn_counters_by_category

end
