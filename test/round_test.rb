require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'minitest/autorun'
require 'minitest/pride'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_initializes
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn
    turn = @round.take_turn("Juneau")
    assert_instance_of Turn, turn  #@round.take_turn("Juneau")
    assert_equal "Juneau", turn.guess
    assert_equal @card_2, @round.current_card
    assert_equal 1, @round.turns.count
  end

  def test_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Earth")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Earth")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Earth")

    assert_equal 50.0, @round.percent_correct
  end

  def test_number_of_cards_in_deck_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Earth")

    assert_equal 1, @round.number_of_cards_by_category(:Geography)
    assert_equal 1, @round.number_of_cards_by_category(:STEM)
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Earth")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    assert_equal 0.0, @round.percent_correct_by_category(:STEM)
  end
end
