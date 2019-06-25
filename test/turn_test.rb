require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_turn_exists
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_card_filled_out
    turn.card
  end

  def guess
    turn.guess
  end

  def correct_guess
    turn.correct?

    assert_equal "Juneau", card.answer
  end

  def result
    turn.feedback
  end
end
