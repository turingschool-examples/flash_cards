require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'


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
end
