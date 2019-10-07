require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/round'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/turn'

class RoundTest < Minitest::Test

  def setup
    @card1 = Card.new("Test", "Test", :test)
    @card2 = Card.new("test", "test", :other_test)
    @cards = [@card1, @card2]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_existence
    assert_instance_of Round, @round
  end

  def test_start
    assert_nil nil, @round.start
  end

  def test_take_turn
    assert_equal "Correct", @round.take_turn('Test', @card1)
  end

  def test_get_score
    assert_equal 50, @round.get_score(1,2)
  end

  def test_get_score_by_cat

    @round.take_turn('Test', @card1)
    @round.take_turn('hello', @card2)

    assert_equal ["Test: 100.0%", "Other Test: 0.0%"], @round.get_score_by_category

  end
end

