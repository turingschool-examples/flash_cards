require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("what's your answer?:", Card)

    assert_instance_of Turn, turn
  end

   def test_it_has_a_string
     turn = Turn.new("what's your answer?:", Card)

     assert_equal "What's your answer?:", Card
   end
end
