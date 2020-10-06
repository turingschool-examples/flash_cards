require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
# require './lib/card'

class CardTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end
end 
    # card = card.new("What is the capital of Alaska?", "Juneau", :Geography)
