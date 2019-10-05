require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn' #I'm getting an error here, but I can't see what's different here compared to other requires 
require './lib/card'
require 'pry'

class TurnTest < Minitest::Test

#does it exist?
  def test_it_exists

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Columbus", card)

    assert_instance_of Turn, turn
  end

#can it return card?
  def test_return_card

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Columbus", card)

    assert_equal card, turn.card
  end

#can it guess?
  def test_guess

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Columbus", card)

    assert_equal "Columbus", turn.guess
  end

#can it return correct?
  def test_correct

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Columbus", card)

    assert_equal true, turn.correct?
  end

#can it return feedback?
  def test_feedback

    card = Card.new("What's the capital of Ohio?", "Columbus", :Geography)
    turn = Turn.new("Columbus", card)

    assert_equal "Correct!", turn.feedback
  end

end
