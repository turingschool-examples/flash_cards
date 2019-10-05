require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("What is the tallest mountain in Russia?", "Mount Elbrus", :Geography)
    @card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_4 = Card.new("Where is the world's largest living aspen grove?", "Utah", :STEM)
    @card_5 = Card.new("How many paintings did Vincent Van Gogh sell during his lifetime?", "1", :Art)
    @card_6 = Card.new("What Spanish painter is often referred to as both the last of the Old Masters and the first of the moderns?", "Francisco de Goya", :Art)

    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_initialize
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_new_turn_exists
    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
  end

  def test_guess_correct
    new_turn = @round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_turn_has_been_recorded
    new_turn = @round.take_turn("Juneau")

    assert_equal [new_turn, @round.take_turn("Juneau")], @round.turns
  end
end
