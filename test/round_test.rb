require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require "pry"

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_deck
    assert_equal @deck, @round.deck
  end

  def test_initial_turns
    assert_equal [], @round.turns
  end

  def test_current_card_1
    skip
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_1

  end

  def test_turn_1_class
    skip
  end

  def test_turn_1_correct
    skip
  end

  def test_turns_array_1
    skip
  end

  def test_number_correct_1
    skip
  end

  def test_current_card_2
    skip
  end

  def test_turns_count
    skip
  end

  def test_turns_last_feedback
    skip
  end

  def test_number_correct_2
    skip
  end

  def test_number_correct_by_category_1
    skip
  end

  def test_number_correct_by_category_2
    skip
  end

  def test_percent_correct
    skip
  end

  def test_percent_correct_by_category_1
    skip
  end

  def test_current_3
    skip
  end

end
