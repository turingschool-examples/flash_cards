require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @cardt = Card.new("What is the sum of 5 + 5?", 10, :Math)
    @turnt = Turn.new(10, @cardt)
  end

  def test_for_instance
    @turnt

    assert_instance_of Turn, @turnt
  end

  

end
