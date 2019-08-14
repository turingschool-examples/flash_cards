require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Juneau", Card)

    assert_instance_of Turn, turn
  end

   def test_it_has_a_string
     turn = Turn.new("Juneau", Card)

     assert_equal "Juneau", Card
   end
end
