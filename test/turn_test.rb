require_relative 'test_helper'
require './lib/turn'
require './lib/card'

class TurnTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn_1 = Turn.new("Juneau", @card_1)
    
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  def test_turns_exist
    assert_instance_of Turn, @turn_1
    assert_instance_of Turn, @turn_2
  end

  def test_turn_has_card
    assert_equal @card_1, @turn_1.card
    assert_equal @card_2, @turn_2.card
  end

  def test_turn_has_guess
    assert_equal "Juneau", @turn_1.guess
    assert_equal "Saturn", @turn_2.guess
  end

  def test_turn_checks_correctness
    assert @turn_1.correct?
    refute @turn_2.correct?
  end

  def test_turn_returns_feedback
    assert_equal "Correct", @turn_1.feedback
    assert_equal "Incorrect", @turn_2.feedback
  end
end

