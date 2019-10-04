require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card'

class RoundTest < Minitest::Test

  def setup
    @round = Round.new(deck)
  end

  def test_initialize
    assert_instance_of Round, @round
  end

end
