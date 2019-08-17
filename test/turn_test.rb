require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

# a method for every iteration?
# iteration instructions has each new card as 'card' but you need card_1 and card_2 in testing to differentiate

class TurnTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closesto the sun?", "Mercury", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  def test_new_card
    assert_instance_of Card, @card_1
  end

  def test_turn_exists
    assert_instance_of Turn, @turn_1
  end

  def test_card_method
    assert_equal @card_1, @turn_1.card
  end

  def test_guess
    refute_nil @turn_1.guess
  end

  def test_correct
    assert (@turn_1.guess == @card_1.answer) == @turn_1.correct?
  end

  def test_feedback
    assert (@turn_1.correct? && @turn_1.feedback == "Correct!") || (!@turn_1.correct? && @turn_1.feedback == "Incorrect.")
  end

  def test_second_card
    assert_instance_of Card, @card_2
  end

  def test_second_turn_exists
    assert_instance_of Turn, @turn_2
  end

  def test_card_method_2
    assert_equal @card_2, @turn_2.card
  end

  def test_wrong_guess
    refute_nil @turn_2.guess
  end

  def test_correct_wrong_guess
    assert (@turn_2.guess == @card_2.answer) == @turn_2.correct?
  end

  def test_feedback_wrong_guess
    assert (@turn_2.correct? && @turn_2.feedback == "Correct!") || (!@turn_2.correct? && @turn_2.feedback == "Incorrect.")
  end

end
