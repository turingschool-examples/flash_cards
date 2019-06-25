require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require "pry"

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_deck
    assert_equal @deck, @round.deck
  end

  def test_initial_turns
    assert_equal [], @round.turns
  end

  def test_inital_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_1
    new_turn = @round.take_turn("Juneau")
    assert_equal Turn.new("Juneau", @card_1), new_turn
  end

end
