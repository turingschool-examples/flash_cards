require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'


class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @guess_correct = "Juneau"
    @guess_incorrect = "Bob"
    @correct_turn = Turn.new(@guess_correct, @card)
    @incorrect_turn = Turn.new(@guess_incorrect, @card)
  end

  def test_correct?
    expected = @correct_turn.correct?
    assert_equal true, expected

    expected = @incorrect_turn.correct?
    assert_equal false, expected
  end

  def test_feedback
    expected = @correct_turn.feedback
    assert_equal "Correct!", expected

    expected = @incorrect_turn.feedback
    assert_equal "Incorrect.", expected
  end
end
