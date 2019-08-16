require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Anchorage", @card)

    #you were hitting turn variable undefined because it wasn't set as an instance variable
  end

  def test_it_exists
    # your original error on line ten
    # 'initialize'
    # 'new'
    # 'test_it_exists'
    # reads bottom to top. The first message ('initialize') is where the actual error is.

    assert_instance_of Turn, @turn
  end

  def test_if_card_pulled_from_deck

    assert_equal @card, @turn.card
  end

  def test_guess_answer

    assert_equal "Anchorage", @turn.guess
  end

  def test_whether_guess_correct

    assert_equal false, @turn.correct?
    # refute turn.correct?
  end

  def test_feedback

    assert_equal "Incorrect.", @turn.feedback
  end
end
