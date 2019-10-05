require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'

class TurnTest < Minitest::Test

  def test_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Bangor", card)

  assert_equal "Bangor",turn.guess
  end

  def test_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Bangor", card)

  assert_equal card,turn.card
  end

  def test_the_answer_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

   turn = Turn.new("Juneau", card)
   assert_equal true, turn.correct?
  end

end
