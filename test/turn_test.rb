require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

#does it exist?
  def test_it_exists

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

#can it return card?
  def test_return_card

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
  end

#can it guess?
  def test_guess

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

#can it return correct?
  def test_correct

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal false, turn.correct?
  end

#can it return feedback?
  def test_feedback

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Incorrect.", turn.feedback
  end

end
