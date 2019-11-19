require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
  end

  def test_it_exists

    assert_instance_of Turn, @turn_1
    assert_instance_of Turn, @turn_2
  end

  def test_it_has_card

    assert_equal @card_1, @turn_1.card
    assert_equal @card_2, @turn_2.card
  end

  def test_it_can_return_a_guess

    assert_equal "Juneau", @turn_1.guess
    assert_equal "Saturn", @turn_2.guess
  end

  def test_guess_is_correct

    assert_equal @turn_1.guess == @card_1.answer, @turn_1.correct?
    assert_equal @turn_2.guess == @card_2.answer, @turn_2.correct?
  end

  def test_it_gives_feedback

    assert_equal "Correct!", @turn_1.feedback
    assert_equal "Incorrect.", @turn_2.feedback
  end

end
