require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

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

  def test_it_is_created_with_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_has_empty_turns_array
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_turns_creates_new_instance_object
    assert_equal @new_turn, @round.take_turn("Juneau")
  end

  def test_new_turn_is_instance_of_turn
    assert_instance_of Turn, @new_turn.class
  end

  def test_is_turn_correct?
    assert_equal true, @new_turn.correct?
  end

  def test_turns_are_added_to_turns_array
    assert_equal [@new_turn], @round.turns
  end

  def test_it_keeps_track_of_number_correct
    @round.turns
    assert_equal 1, @round.number_correct
  end

  def test_it_will_have_new_current_round_card
    @rounds.turns
    assert_equal @card_2, @round.current_card
  end

  def test_take_turn_will_create_a_new_turn_instance_object
    assert_instance_of Turn, @round.take_turn("Venus")
  end

  def test_how_many_turns_taken
    @rounds.turns
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_it_can_give_last_feedback
    @rounds.turns
    @round.take_turn("Venus")
    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_correct_is_still_one
    @rounds.turns
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @rounds.turns
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_it_can_give_percent_correct_overall
    @rounds.turns
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct
  end

  def test_perfect_correct_by_category
    @rounds.turns
    @round.take_turn("Venus")
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

  def test_current_card_changes_to_last_card
    assert_equal @card_3, @round.current_card
  end
end
