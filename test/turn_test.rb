require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)
    # your original error on line ten
    # 'initialize'
    # 'new'
    # 'test_it_exists'
    # reads bottom to top. The first message ('initialize') is where the actual error is.

    assert_instance_of Turn, turn
  end
end
