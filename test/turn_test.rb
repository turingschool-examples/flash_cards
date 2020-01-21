require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'
require './lib/card.rb'

class TurnTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card_1)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card_1)

    assert_equal "Anchorage", turn.guess
  end

  def test_it_has_a_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card_1)

    assert_equal card_1, turn.card
  end

  def test_if_guess_matches_answer
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card_1)

   refute turn.correct?
  end

  def test_it_gives_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card_1)

    assert_equal "Incorrect.", turn.feedback
  end
  
end
