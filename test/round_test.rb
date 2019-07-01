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

    assert_equal @card_1, @round.current_card
  end

  def test_round_take_turn_method

    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
  end

  def test_round_take_turn_correct_method

    new_turn = round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_round_turns_return_card_1
    skip

    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, round.turns
  end

end
