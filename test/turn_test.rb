require './lib/turn'
require 'minitest/autorun'
require 'minitest/pride'

class TurnTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
    assert_equal card, turn.card
    assert_equal "Juneau", turn.guess
  end

  def test_correct?
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal true, turn.correct?
  end

  def test_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end
end
