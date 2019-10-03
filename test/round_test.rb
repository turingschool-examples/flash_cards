require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/round'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/turn'

class RoundTest < Minitest::Test

  def setup
    @card = Card.new("Test", "Test", :test)
    @cards = [@card]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_existence
    assert_instance_of Round, @round
  end

  def test_start
    assert_nil nil, @round.start
  end

  def test_select_card
    assert_equal @card, @round.select_card
  end

  def test_take_turn
    assert_equal "Correct", @round.take_turn('Test', @card)
  end

  def test_get_score
    assert_equal 50, @round.get_score(1,2)
  end
end