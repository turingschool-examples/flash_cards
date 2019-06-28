require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck'
require './lib/turn.rb'
require './lib/round.rb'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_that_round_exists

  assert_instance_of Round, @round
  end

  def test_that_round_has_deck

    assert_instance_of Deck, @round.the_deck
  end
  def test_that_round_has_turns

    assert_equal [], @round.turns
  end

  def test_show_current_card

    assert_equal @card_1, @round.current_card
  end

  def test_take_turn

    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_is_new_turn_correct

    assert_equal true, @round.take_turn("Juneau").correct?
  end
end
