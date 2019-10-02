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
    assert_equal true, @turn.correct?
  end

  def test_it_gives_feedback
    assert_equal "Correct!", @turn.feedback
  end
end

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn = Turn.new("Saturn", @card)
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
  end

  def test_it_has_a_guess
    assert_equal "Saturn", @turn.guess
  end

  def test_is_guess_correct
    assert_equal false, @turn.correct?
  end

  def test_it_gives_feedback
    assert_equal "Sorry, that is incorrect.", @turn.feedback
  end

end
