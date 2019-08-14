require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)

  end

  def test_it_exists
    assert_instance_of Turn, @turn
    end

  def test_the_card
    assert_equal @card, @turn.card
  end

  def test_the_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_correct?
    assert_equal true, @turn.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn.feedback
  end
end
