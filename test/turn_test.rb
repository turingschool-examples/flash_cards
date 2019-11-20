require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, card
  end

  def test_it_turns
    turn = Turn.new("Juneau", card)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_card
    turn = Turn.new("Juneau", card)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of  card, turn.card
  end

  def test_it_has_a_guess
    turn = Turn.new("Juneau", card)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Juneau", turn.guess
  end

  def test_is_it_correct?
    turn = Turn.new("Juneau", card)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert true, turn.correct?
  end

  def test_feedback_provided
    turn = Turn.new("Juneau", card)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Correct!", turn.feedback
  end

  def test_it_exists
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_instance_of Card, card
  end

  def test_it_turns
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_card
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_instance_of Card, turn.card
  end

  def test_it_has_a_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Saturn", turn.guess
  end

  def test_is_it_correct?
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal false, turn.correct?
  end

  def test_feedback_provided
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Incorrect.", turn.feedback
  end
end
