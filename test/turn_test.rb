require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
def setup
  @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  @turn = Turn.new("Juneau", @card_1)
end

  def test_it_exists

    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess

    assert_equal "Juneau", @turn.guess
  end

  def test_if_card_exist

    assert_equal @card_1, @turn.card
  end

  def test_if_guess_is_correct

    assert_equal true, @turn.correct?
  end

  def test_feedback_output_is_correct

    assert_equal "Correct", @turn.feedback
  end

end
