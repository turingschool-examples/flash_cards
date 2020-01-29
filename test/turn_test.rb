require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_card_exists
    skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    assert_instance_of Card, card
  end

  def test_turn_exists
    skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

  def test_card_method
    skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal card, turn.card
  end

  def test_guess_method
    skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Juneau", turn.guess
  end

  def test_correct_answer_method
    skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal true, turn.correct?
  end

  def test_feedback_method
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)
    assert_equal "Correct!", turn.feedback
  end
end


#pry(main)> turn.feedback
