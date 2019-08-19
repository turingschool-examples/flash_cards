require "pry"
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

  def test_if_round_exists
    assert_instance_of Round, @round
  end

  def test_if_turns_exists
    assert_equal [], @round.turns
  end

  def test_it_has_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_takes_turn
    last_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, last_turn
    assert last_turn.correct?
    assert_equal [last_turn], @round.turns
    assert_equal @card_2, @round.current_card
  end

  def test_it_has_number_correct
    assert_equal 0, @round.number_correct
    @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
    @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_it_has_number_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)

    @round.take_turn("Venus")
    assert_equal 0,@round.number_correct_by_category(:STEM)

    @round.take_turn("North north west")
    assert_equal 1,@round.number_correct_by_category(:STEM)
  end

  def test_it_has_percent_correct
    @round.take_turn("Juneau")

    assert_equal 100, @round.percent_correct
    @round.take_turn("Juneau")

    assert_equal 50, @round.percent_correct
  end
end
