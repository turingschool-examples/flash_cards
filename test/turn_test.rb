require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Juneau", Card)

    assert_instance_of Turn, turn
  end

  def test_it_can_return_a_guess
    turn = Turn.new("Juneau", Card)

    assert_equal "Juneau", turn.guess
  end

  def test_it_can_return_a_card
    turn = Turn.new("Juneau", Card)

    assert_equal card, turn.return_card
  end
end
