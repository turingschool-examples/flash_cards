require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5 clockwise from due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_turns_array_is_empty
    assert_equal [], @round.turns
  end

  def test_current_card_matches_first_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_returns_turn
    result = @round.take_turn("Juneau")
    assert_instance_of Turn, result
  end

  def test_take_turn_returns_class_turn
    result = @round.take_turn("Juneau")

    assert_equal Turn, result.class
  end

  def test_if_new_turn_is_correct
    result = @round.take_turn("Juneau")

    assert result.correct?
  end

  def test_new_turn_returns_in_array
    new_turn = @round.take_turn("Juneau")

    assert_equal [new_turn], @round.turns
  end

  def test_number_correct_of_all_take_turns
    assert_equal 0, @round.number_correct

    correct_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct

    incorrect_turn = @round.take_turn("Saturn")
    assert_equal 1, @round.number_correct
  end

  def test_take_turn_returns_next_card
    first_turn = @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_count_of_turns_taken
    first_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 2, @round.turns.count
  end

  def test_feedback_on_previous_turn
    first_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_correct_turns_by_category
    first_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")
  end

  def test_total_cards_per_category
    assert_equal ({}), @round.total_category

    correct_turn = @round.take_turn("Juneau")
    assert_equal ({:Geography => 1}), @round.total_category

    incorrect_turn = @round.take_turn("Saturn")
    assert_equal ({:Geography => 1, :STEM => 1}), @round.total_category
  end

  def test_calculate_category_correct
    assert_equal ({}), @round.category_correct

    correct_turn = @round.take_turn("Juneau")
    assert_equal ({:Geography => 1}), @round.category_correct

    incorrect_turn = @round.take_turn("Venus")
    assert_equal ({:Geography => 1, :STEM => 0}), @round.category_correct
  end

  def test_number_correct_by_category
    turn_geography = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)

    turn_stem = @round.take_turn("Venus")
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_record_guess_all_turns
    assert_equal 0, @round.record_guess

    first_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.record_guess

    next_turn = @round.take_turn("Saturn")
    assert_equal 2, @round.record_guess
  end

  def test_percent_correct
    first_turn = @round.take_turn("Juneau")
    next_turn = @round.take_turn("Saturn")

    # binding.pry
    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category_geography
    
  end
end
