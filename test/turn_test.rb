require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def setup
    @turn = Turn.new("Juneau", card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

end
