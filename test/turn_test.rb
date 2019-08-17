require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn_1
    assert_instance_of Turn, @turn_2
  end

  def test_attributes
    assert_equal @card_1, @turn_1.card
    assert_equal @card_2, @turn_2.card

    assert_equal "Juneau", @turn_1.guess
    assert_equal "Saturn", @turn_2.guess
  end

  def test_correct
    assert @turn_1.correct?
    refute @turn_2.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn_1.feedback
    assert_equal "Incorrect.", @turn_2.feedback
  end
end
