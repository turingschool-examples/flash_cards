require "minitest/autorun"
require "minitest/pride"
require "./lib/turn"
require "./lib/card"

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    assert_instance_of Turn, turn
  end

end
