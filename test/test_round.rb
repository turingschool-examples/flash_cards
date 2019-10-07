require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class DeckTest < Minitest::Test
  attr_reader :deck,
              :card1,
              :card2,
              :card3

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [@card1, @card2, @card3]
    @deck = Deck.new(cards)
    @round = Round.new(deck)
    @turn = Turn.new("Anchorage", @card1)
    @next_turn = Turn.new("Mars", @card2)
  end

  def test_round_exist
    assert_instance_of Round, @round
  end

  def test_deck_in_round_exists
    assert_equal @deck, @round.deck
  end

  def test_turns_exist
    assert_equal [], @round.turns
  end

  def test_turns_can_happen
    @round.take_turn("Juneau")
    assert_equal 1, @round.turns.count
    assert_equal 2, @round.deck.count
  end

  def test_current_card_display
    assert_equal @card1, @round.current_card
  end

  def test_correct_answer_count
    @round.take_turn("Anchorage")
    assert_equal 0, @round.number_correct
  end

  def test_correct_answer_count_by_category
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)

    @round.take_turn("Mercury")
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

end
