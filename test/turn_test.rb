require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/Turn'

class TurnTest < Minitest::Test

  def test_turn_exists
    turn = Turn.new("Juneau", "What is the capital of Alaska?")
    assert_instance_of Turn, turn
  end

  def test_it_has_a_user_guess
    turn = Turn.new("Juneau", "What is the capital of Alaska?")
    assert turn.guess
  end

  def test_the_guess_is_correct
    turn = Turn.new("Juneau", "What is the capital of Alaska?")
    assert turn.correct?
  end
end
