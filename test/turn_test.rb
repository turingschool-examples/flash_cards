require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end


end
