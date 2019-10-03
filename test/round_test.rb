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
    @cards = [@card_1, @card_2, @card_3]

    @turn_1 = Turn.new("Juneau", @card_1)
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_card_exists
    assert_instance_of Card, @card_1
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_class
    assert_equal Turn, @turn_1.class
  end

  def test_new_turn_correct
    skip
    assert_equal true, @turn_1.correct?
  end

  def test_turns_exists
    skip
    assert_instance_of Array, @round.turns
  end

  def test_turns_gets_card_each_turn
    @round.take_turn("")
    assert_equal [@card_1], @round.turns

    @round.take_turn("")
    assert_equal [@card_1, @card_2], @round.turns

    @round.take_turn("")
    assert_equal [@card_1, @card_2, @card_3], @round.turns
  end
end
