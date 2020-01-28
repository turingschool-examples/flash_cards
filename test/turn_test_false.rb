require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("Which planet is the closest to the sun?", "Mercury", :STEM)
    @turn = Turn.new("Saturn", @card)
  end


  def test_it_exists

    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess

    assert_equal "Saturn", @turn.guess
  end

  def test_is_it_correct?

    assert_equal false, @turn.correct?
  end

  def test_does_it_have_a_card

    assert_equal @card, @turn.card
  end


  def test_it_has_feedback

    assert_equal "Incorrect.", @turn.feedback
  end
end
