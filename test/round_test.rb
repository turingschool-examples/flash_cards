require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
   assert_instance_of Round, @round
  end

  def test_round_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_array_initializes_empty
    assert_equal [], @round.turns
  end

  def test_current_card_deck
    assert_equal @card_1, @round.current_card
  end
  def test_it_can_take_a_turn

  end

  def test_if_guess_is_correct
    assert_equal, true, @round.turn.correct?
  end

  def test_total_number_of_correct_guesses
    @round.correct?
    assert_equal "Correct Guesses: 1", @round.number_correct
  end

  def test_it_gives_feedback
    @round.take_turn("Juneau")
    @round.correct?
    assert_equal "Correct", @round.turn.feedback
  end

end
