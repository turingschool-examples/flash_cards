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

  def test_it_exists
    assert_equal @turn_1.class, Turn
  end

  def test_it_has_attributes
    assert_equal @turn_1.guess, "Juneau"
    assert_equal @turn_1.card, @card_1
  end

  def test_it_can_tell_the_correctness_of_a_guess
    assert @turn_1.correct?
    refute @turn_2.correct?
  end

  def test_it_shows_text_corresponding_to_guess_correctness
    assert_equal @turn_1.feedback, "Correct!"
    assert_equal @turn_2.feedback, "Incorrect."
  end

end
