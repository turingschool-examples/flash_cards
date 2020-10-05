require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/turn"
require "pry";

class TurnTest < Minitest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_has_attributes
    assert_equal @card, @turn.card
    assert_equal "Juneau", @turn.guess
  end
