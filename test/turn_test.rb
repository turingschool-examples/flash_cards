require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  #test_it_has_a_card
  #test_it_returns_true_for_correct_guess
  #test_it_returns_false_for_an_incorrect_guess
  #test_it_returns_correct_for_a_correct_guess
  #test_it_returns_incorrect_for_an_incorrect_answer
end
