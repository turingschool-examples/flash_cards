require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_it_exists
    turn = Turn.new("Juneau", Card)
    assert_instance_of Turn, turn
  end

  def test_what_card_it_is
    turn = Turn.new("Juneau", Card)
    assert_equal Card, turn.card
  end
  #test_what_guess_is
  #test_if_correct
  #test_if_theres_feedback
end
