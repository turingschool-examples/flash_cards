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
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)



  end

  def test_round_new

      assert_instance_of Round, @round
  end

  def test_round_deck_method

    assert_equal @deck, @round.deck
  end

  def test_round_turns_method

    assert_equal [], @round.turns
  end

  def test_round_current_card_method
    turn_1 = @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_round_take_turn_method_card_1
    turn_1 = @round.take_turn("Juneau")

    assert_equal Turn, turn_1.class
  end

  def test_round_take_turn_correct_method
      turn_1 = @round.take_turn("Juneau")

    assert_equal true, turn_1.correct?
  end

  def test_round_turns_return_card_1
      turn_1 = @round.take_turn("Juneau")

    assert_instance_of Array, @round.turns
  end

  def test_number_correct_method
    turn_1 = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_current_card_card_2
    turn_1 = @round.take_turn("Juneau")
    turn_2 = @round.take_turn("Venus")

    assert_equal @card_3, @round.current_card
  end

  def test_turns_count
    skip
    assert_equal 2, @round.turns.count
  end


end
