require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_string
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_it_has_a_card
    turn = Turn.new("Juneau", card)

    assert_equal "card", turn.card
  end

end
