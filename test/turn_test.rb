require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn2 = Turn.new("Saturn", @card2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_guess
    assert_equal "Juneau", @turn.guess
    assert_equal "Saturn", @turn2.guess
  end

  def test_it_has_a_card
    assert_equal @card, @turn.card
    assert_equal @card2, @turn2.card
  end


  def test_it_checks_correct?
    assert_equal true, @turn.correct?
    assert_equal false, @turn2.correct?
  end

  def test_it_gives_feedback
    assert_equal "Correct!", @turn.feedback
    assert_equal "Incorrect!", @turn2.feedback
  end

end
