require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < MiniTest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card1)

    assert_equal card, turn.card
  end

  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau, card")

    assert_equal "Juneau", turn.guess
  end

  def test_if_correct_returns_true
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card1)

    assert_equal true, turn.correct?
  end

  def test_if_incorrect_returns_false
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Tucson", card1)

    assert_equal false, turn.correct?  
  end

end
