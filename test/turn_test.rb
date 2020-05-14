require "minitest/autorun"
require "minitest/pride"
require "./lib/turn"
require "./lib/card"

class TurnTest < Minitest::Test

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn1 = Turn.new("Juneau", @card1)
    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn2 = Turn.new("Saturn", @card2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn1
    assert_instance_of Turn, @turn2
  end

  def test_it_is_created_with_a_card
    assert_equal @card1, @turn1.card
    assert_equal @card2, @turn2.card
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn1.guess
    assert_equal "Saturn", @turn2.guess
  end

  def test_is_it_correct
    assert @turn1.correct?
    refute @turn2.correct?
  end

  def test_it_can_give_feedback
    assert_equal "Correct!", @turn1.feedback
    assert_equal "Incorrect!", @turn2.feedback
  end
end
