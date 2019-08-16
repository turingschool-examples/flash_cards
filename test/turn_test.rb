require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_turn_exists

    assert_instance_of Turn, @turn
  end

  def test_it_has_a_card

    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess

    assert_equal "Juneau", @turn.guess
  end

  def test_it_is_correct

    assert_equal true, @turn.correct?
  end

  def test_it_has_feedback

    assert_equal "Correct!", @turn.feedback
  end 
end
# assert_equal card.question, "What is the capital of Alaska?"
# assert_equal card.answer, "Juneau"
# assert_equal turn.guess, "Juneau"
