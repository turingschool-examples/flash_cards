require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @card_4 = Card.new(1, 2, 3)
    @cards = [@card_1, @card_2, @card_3, @card_4]
    @deck =  Deck.new([@card_1, @card_2, @card_3, @card_4])
    @turns = []
    @round = Round.new(@deck)
    # @new_turn = Turn.new(guess)

  end # setup

  def test_if_deck_and_round_exist
    @deck
    @round
    assert_instance_of Deck, @deck
    assert_instance_of Round, @round
  end

  def test_if_round_has_deck
    assert_equal @deck, @round.deck
  end
  def test_if_round_has_turns
    assert_equal [], @round.turns
  end
  def test_if_round_has_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_if_round_has_new_turn
    assert_instance_of Turn, new_turn
    assert_equal @new_turn, @round.take_turn("Jeneau")
end

def it_has_new_turn_class
  new_turn = Turn.new("Juneau", @card_1)
assert_equal Turn, @round.take_turn("Juneau").class
end

def it_has_new_turn_correct
  new_turn = Turn.new("Juneau", @card_1)
  assert_equal true, new_turn.correct?
end


end
