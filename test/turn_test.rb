require 'minitest'
require 'minitest/autorun'

require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("Who is the cutest cat in the whole world?", "Crona", :Pop_Culture)
    @turn = Turn.new("Crona", @card)
  end

  def test_turn_exists
    assert_instance_of Turn, @turn
  end
end
