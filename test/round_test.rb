require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_round_exists

    assert_instance_of Round, @round
  end

  def test_round_has_deck

    assert_equal @deck, @round.deck
  end

  def test_round_has_turns

    assert_equal [], @round.turns
  end

  def test_round_has_current_card

    assert_equal @cards[0], @round.current_card
  end

  def test_has_new_turn

    assert_instance_of Turn, new_turn = @round.take_turn("Juneau")
    # assert_equal current_card, @deck.cards[0]
    #assert_equal
  end

  def test_if_new_turn_into_turns
      new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.turns.count
  end  

end
