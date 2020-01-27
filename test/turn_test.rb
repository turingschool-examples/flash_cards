require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < MiniTest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Card, @card
    assert_instance_of Turn, @turn
  end

  def test_card_takes_turns
    assert_equal @card, @turn.card
  end

  def test_guesses
    assert_equal "Juneau", @turn.guess
  end

  def test_guesses_can_be_correct
    assert @turn.correct?
  end

  def test_feedback
    assert_equal "Correct!", @turn.feedback
  end

  def test_guesses_can_be_incorrect
   @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
   @turn = Turn.new("Saturn", @card)

   assert_equal "Saturn", @turn.guess
   refute @turn.correct?
   assert_equal "Incorrect!", @turn.feedback
  end
end
