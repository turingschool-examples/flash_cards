require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'


class TurnTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card_1)

    assert_instance_of Turn, turn
  end

end
