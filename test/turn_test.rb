require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'

class TurnTest < Minitest::Test

  def setup

    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)

  end

  def test_turn_new

    assert_instance_of Turn, @turn
  end

  def test_turn_attributes

    assert_equal @card, @turn.card

    assert_equal "Juneau", @turn.guess
  end

  def test_method_true

    assert @turn.correct?

    assert_equal "Correct!", @turn.feedback
end

  def test_method_false
    turn = Turn.new("Saturn", @card)

  refute turn.correct?

    assert_equal "Incorrect!", turn.feedback
  end
end
