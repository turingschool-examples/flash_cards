require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require 'pry'

class TurnTest < Minitest::Test
  def test_turn_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card)
    turn = Turn.new("Saturn", card)

  assert_instance_of Turn, turn

  end

  def test_it_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
  end

  def test_return_user_guess
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  assert_equal "Juneau", turn.guess
  end

  def test_is_guess_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal true, turn.correct?
  end

  def test_feeback
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Correct!", turn.feedback
  end
end
