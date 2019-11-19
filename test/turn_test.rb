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
  end

  def test_it_has_card

    assert_equal @card_1, @turn_1.card
  end

  def test_it_can_return_a_guess

    assert_equal "Juneau", @turn_1.guess
  end

  def test_guess_is_correct

    assert_equal true, @turn_1.correct?
  end

  def test_it_gives_feedback

    assert_equal "Correct!", @turn_1.feedback
  end

end
