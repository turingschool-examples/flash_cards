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
end
