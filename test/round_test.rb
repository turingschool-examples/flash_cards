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

  def test_the_deck_exists
    assert_equal @deck, @round.deck
  end

  def test_there_are_no_turns_initially
    assert_equal [], @round.turns
  end

  def test_current_card_is_first_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_class
    new_turn = @round.take_turn("Juneau")
    assert_equal Turn, new_turn.class
  end

  def test_if_guess_is_correct
    new_turn = @round.take_turn("Juneau")
    assert_equal true, new_turn.correct?
  end

  def test_if_each_turn_is_stored_in_array
    new_turn = @round.take_turn("Juneau")
    assert_equal [new_turn], @round.turns
  end

  def test_number_correct
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_current_card_goes_to_second_card_in_deck_after_turn_is_taken
    new_turn = @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
  end

  def test_taking_second_turn
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_feedback_for_second_turn_in_round
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_correct_in_round_after_two_turns
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category_in_round
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_number_correct_by_category_in_round_for_STEM
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct_after_two_rounds
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

  def test_current_card_after_two_turns_in_round
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal @card_3, @round.current_card
  end
end
