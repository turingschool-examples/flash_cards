require 'minitest/autorun'
require 'minitest/pride'
require '../lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Anchorage", card)

    assert_instance_of Turn, turn
  end

end
