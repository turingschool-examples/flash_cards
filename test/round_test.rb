require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class RoundTest< MiniTest::Test

  def does_it_exist
    round = Round.new(deck)
    assert_instance_of Round, round
  end
end
