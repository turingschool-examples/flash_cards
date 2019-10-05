require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/turn'
require '../lib/deck'
require '../lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [card_1, card_2, card_3]
    @deck = Deck.new(@cards)
    # deck = Deck.new([card_1, card_2, card_3])
    @round =Round.new(@deck)
    # round = Round.new(deck)
    # round.deck
    # round.turns
  end

  def test_round_exists
    round = Round.new(@deck)
    assert_instance_of Round, round
    # assert_equal @round, Round.new(@deck)
  end

  def test_round_has_deck
    round = Round.new(@deck)
    assert_instance_of Deck, round.deck
  end

  def test_round_turns
    round = Round.new(@deck)
    assert_equal [], round.turns
  end

  def test_current_card
    round = Round.new(@deck)
    assert_equal @cards.first, round.current_card
  end

  def test_you_took_turn
    round = Round.new(@deck)
    assert_instance_of Turn, round.take_turn("guess")
  end

  def test_new_turn_is_a_turn_class
    round = Round.new(@deck)
    assert_equal Turn, round.take_turn("guess").class
    # does the same as above test
  end

end
