
require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("Which planet is closet to the sun?", "Mercury", :STEM)
    @turn = Turn.new("Saturn", @card)
  end


  def test_if_exists
    assert_instance_of Card, @card
  end

  def test_new_turn
    assert_instance_of Turn, @turn
  end

  def test_guess_returns_the_guess
    assert_equal "Saturn", @turn.guess
  end


end
