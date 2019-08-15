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

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_it_has_a_card
    assert_instance_of Card, @turn.card
  end

  def test_if_it_has_correct_feedback
    assert_equal "Correct!", @turn.feedback
  end

  def test_it_has_incorrect_feedback
    turn = Turn.new("Denver", @card)
    assert_equal "Incorrect.", turn.feedback
  end

  def test_it_is_correct?
    assert_equal true, @turn.correct?
  end

  def test_is_it_isnt_correct?
    turn = Turn.new("Denver", @card)
    assert_equal false, turn.correct?
  end
end
