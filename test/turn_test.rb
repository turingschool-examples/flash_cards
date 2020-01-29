require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @card2 = Card.new("Which planet is the closest to the sun?", "Mercury", :STEM)
    @turn2 = Turn.new("Saturn", @card2)
  end


  def test_it_exists

    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess

    assert_equal "Juneau", @turn.guess
  end

  def test_is_it_correct?

    assert_equal true, @turn.correct?
  end

  def test_is_it_correct_false

    assert_equal false, @turn2.correct?
  end

  def test_does_it_have_a_card

    assert_equal @card, @turn.card
  end

  def test_it_has_feedback_correct

    assert_equal "Correct!", @turn.feedback
  end

  def test_it_has_feedback_incorrect


    assert_equal "Incorrect.", @turn2.feedback
  end



end
