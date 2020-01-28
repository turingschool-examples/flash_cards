require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_turns_access_cards_and_contain_guesses
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Bears", card)

    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
    assert_equal "Bears", turn.guess
  end

  def test_can_see_a_turns_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Bears", card)

    assert_equal "Bears", turn.guess
  end

  def test_card_method_returns_card_info
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
  end

  def test_card_and_guess_get_compared_for_correctness
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Bears", card)
    turn2 = Turn.new("Juneau", card)

    refute turn1.correct?
    assert turn2.correct?
  end

  def test_give_proper_feedback_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Bears", card)
    turn2 = Turn.new("Juneau", card)

    assert_equal "Correct!", turn2.feedback
    assert_equal "Incorrect.", turn1.feedback
  end

end
