require "./lib/deck"
require "./lib/round"
require "./lib/card"
require "Minitest/autorun"
require "Minitest/pride"

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

  def test_deck_is_passed_to_new_round     
    assert_equal @deck, @round.deck
  end

  def test_turns_array_is_initialized
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_creates_turn_object
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn

  end

  def test_new_turn_is_correct
    new_turn = @round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_take_turn_method_records_turns
    new_turn = @round.take_turn("Juneau")

    assert_equal @round.turns[0], new_turn
  end

  def test_number_correct_is_incremented
    new_turn = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_current_card_is_incremented
    new_turn = @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_second_turn_is_counted
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 2, @round.turns.count
  end

  def test_negative_feedback_is_returned
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_correct_is_not_changed_by_wrong_answer
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_percent_correct
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

  def test_current_card_after_two_rounds
    new_turn = @round.take_turn("Juneau")
    second_turn = @round.take_turn("Venus")

    assert_equal @card_3, @round.current_card
  end
end