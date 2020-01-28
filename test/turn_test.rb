require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def test_it_exists
    turn = Turn.new("rando", 1)

    assert_instance_of Turn, turn
  end
end
