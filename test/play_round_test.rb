require_relative 'test_helper'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/play_round'

class PlayRoundTest < MiniTest::Test

  def setup
    @new_game = PlayRound.new
  end

  def test_play_round_starts
    assert_instance_of PlayRound, @new_game
  end
end
