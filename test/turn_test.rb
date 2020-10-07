require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Juneau", Card)
    assert_instance_of Turn, turn
  end

  #test what card it is
  #test_what_guess_is
  #test_if_correct
  #test_if_theres_feedback
end
    # card = card.new("What is the capital of Alaska?", "Juneau", :Geography)
