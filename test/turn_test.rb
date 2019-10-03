require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the sum of 5 + 5?", 10, :Math)
    @turn = Turn.new(11, @card)
  end

  def test_for_instance

    assert_instance_of Turn, @turn
  end

  def test_it_has_guess

    assert_equal 11, @turn.guess
  end

  def test_it_has_card

    assert_equal @card, @turn.card
  end

  def test_correct_when_false

    assert_equal false, @turn.correct?
  end

  def test_correct_when_true
    turn_2 = Turn.new(10, @card)

    assert_equal true, turn_2.correct?
  end

  def test_feedbeack_when_correct
    turn_2 = Turn.new(10, @card)

    assert_equal "Correct!", turn_2.feedback
  end

  def test_feedbeack_when_correct

    assert_equal "Incorrect.", @turn.feedback
  end
end
