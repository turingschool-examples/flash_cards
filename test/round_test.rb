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

  def test_the_round_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_round_starts_with_zero_turns
    assert_equal [], @round.turns
  end

  def test_current_card_is_correct
    assert_equal @card_1, @round.current_card
    @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
  end

  def test_turn_is_created
    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_it_is_second_round_after_first_turn
    @round.take_turn("Juneau")
    assert_equal 1, @round.turns.count

    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  # integration test
  def test_can_return_feedback_for_turn
    @round.take_turn("Juneau")
    assert_equal "Correct!", @round.turns.last.feedback

    @round.take_turn("Ziggy")
    assert_equal "Incorrect!", @round.turns.last.feedback
  end

end
