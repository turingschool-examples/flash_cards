require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_turn_exists
    turn = Turn.new
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    assert_instance_of Turn, turn
  end

end
