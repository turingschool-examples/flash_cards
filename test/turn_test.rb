require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
  end

  def test_is_guess_correct
    skip
    assert_equal true, @turn.correct?
  end

  def test_it_gives_feedback
    skip
    p @turn.feedback
  end
end
