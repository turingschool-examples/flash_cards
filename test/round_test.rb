require 'Minitest/autorun'
require 'Minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
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
  #
  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_if_turns_is_array
    round = Round.new(@deck)
    assert_equal round.turns, []
  end

  def test_take_turn
    round_1 = Round.new(@deck)
    turn_1 = round_1.take_turn("Guess_1")
    assert_equal round_1.turns.first, turn_1
  end

  def test_current_card
    round_1 = Round.new(@deck)
    assert_equal round_1.current_card, @deck.cards[0]
  end

  def test_new_turn
    round = Round.new(@deck)
    turn = round.take_turn("Guess_1")
    assert_equal round.current_card, @card_2
  end

  def test_go_through_deck
      round = Round.new(@deck)
      assert_equal round.current_card, @card_1
      round.take_turn("Guess_1")
      assert_equal round.current_card, @card_2
      round.take_turn("Guess_1")
      assert_equal round.current_card, @card_3
      round.take_turn("Guess_1")
  end
end
