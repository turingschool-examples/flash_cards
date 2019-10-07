require_relative '../lib/card'
require_relative '../lib/turn'
require_relative '../lib/deck'
require_relative '../lib/round'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class RoundTest < Minitest::Test

  def setup

    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_instance

    assert_instance_of Round, @round
  end

  def test_round_has_deck

    assert_equal @deck, @round.deck
  end

  def test_stores_turns

    assert_equal [], @round.turns
  end

  def test_shows_current_card

    assert_equal @card_1, @round.current_card
  end

  def test_instance_of_turn_class
    @round.take_turn("Juneau")

    assert_instance_of Turn, @round.turns.first
  end

  def test_shows_if_correct
    @round.take_turn("Juneau")

    assert_equal @round.turns.first.correct?, true
  end

  def test_it_adds_to_turn_instance_variable
    new_turn = @round.take_turn("Juneau")

    assert_equal [new_turn], @round.turns
  end

  def test_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Mars")

    assert_equal 2, @round.number_correct
  end

  def test_current_card_changes
    @round.take_turn("Juneau")

   assert_equal @card_2, @round.current_card
  end

  def test_can_check_wrong_answer
    @round.take_turn("Juneau")
    @round.take_turn("Travis")

    assert_equal 2, @round.turns.count
    assert_equal "Incorrect", @round.turns.last.feedback
  end

  def test_counts_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Travis")

    assert_equal 1, @round.number_correct
  end

  def test_it_can_calculate_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Travis")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_it_can_calculate_percent
    @round.take_turn("Juneau")
    @round.take_turn("Travis")

    assert_equal 50.0, @round.percent_correct
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

end
