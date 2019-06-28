require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_turn_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  # def test_card
  #   turn.card = @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography
  #
  #   assert_equal "What is the capital of Alaska?", "Juneau", :Geography, turn.card)
  # end

  # def guess
  #   turn.guess
  # end
  #
  # def correct_guess
  #   turn.correct?
  #
  #   assert_equal "Juneau", card.answer
  # end
  #
  # def result
  #   turn.feedback
  # end
end
