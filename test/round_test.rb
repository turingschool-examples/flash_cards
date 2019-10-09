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
  #should have taken another turn to check that it does cycle through the deck end

  def test_if_it_takes_a_turn
   new_turn = @round.take_turn("Juneau")
   assert_equal Turn, new_turn.class
  end
  def test_if_it_is_correct
    new_turn = Turn.new("Juneau", @card_1)
    assert_equal true, new_turn.correct?
  end

  def test_total_number_of_correct_guesses
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_it_gives_feedback
    @round.take_turn("Juneau")
    assert_equal "Correct!", @round.turns.last.feedback
  end
  def test_number_correct_by_category
      @round.take_turn("Juneau")
      @round.take_turn("Mars")
      @round.take_turn("North north west")
      assert_equal 2, @round.number_correct_by_category(:STEM)
  end
  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Madfs")
    @round.take_turn("North north west")
    assert_equal "66.67", @round.percent_correct
  end
  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Madfs")
    @round.take_turn("North north west")
    assert_equal "50.00", @round.percent_correct_by_category(:STEM)
  end
end
