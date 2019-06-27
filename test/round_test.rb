require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class DeckTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
       and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5°
       clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck,@turns)

  end

  def test_if_round_and_deck_exists
    @card_1
    @card_2
    @card_3
    @deck
    @round
    assert_instance_of Round, @round
    assert_instance_of Deck, @deck
  end

  def test_if_round_returns_a_deck
    @card_1
    @card_2
    @card_3
    @deck
    @round
    assert_equal @deck, @round.deck
  end

  def test_if_round_starts_mt_array
    @card_1
    @card_2
    @card_3
    @deck
    @round
    assert_equal [], @round.turns
  end

  def test_if_round_has_current_card
    @card_1
    @card_2
    @card_3
    @deck
    @round
    
    assert_equal @card_1, @round.current_card

  end
  #end class
#
# def test_has_a_deck
#   @card_1
#   @card_2
#   @card_3
#   @deck
#   @round
#
#   assert_equal deck, round.deck
#
# end
#
# def test_has_a_turn
#
#
#
#
# end
 end
