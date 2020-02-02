require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_has_a_card
    assert_equal @card, @turn.card
  end

  def test_turn_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_guess_is_correct_and_incorrect
    assert @turn.correct?

    @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn = Turn.new("Saturn", @card)

    refute @turn.correct?
  end

  def test_can_give_feedback
    assert_equal "Correct!", @turn.feedback

    @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn = Turn.new("Saturn", @card)

    assert_equal "Incorrect!", @turn.feedback
  end
end
