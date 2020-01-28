require './lib/turn'
require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_card 

  end
end
