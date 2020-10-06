require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'
require './lib/card.rb'
require 'pry'

class TurnTest < Minitest::Test

  def test_turn_and_card_objects_exist
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
    assert_instance_of Card, card
  end

  def test_card_query_returns_card_object
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal card, turn.card
  end

  def test_turn_guess_holds_string
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_equal "Juneau", turn.guess
  end

  def test_correct_returns_true_if_turn_guess_matches_card_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    binding.pry
    assert turn.correct?
  end
end
