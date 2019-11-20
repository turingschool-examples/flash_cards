require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @round = Round.new(
    @deck = Deck.new([
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography),
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM),
    @card_4 = Card.new("What is the name of the country that encompasses more than 250 islands?", "Indonesia", :Indonesia)
    ]))
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_turns
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn
    assert_equal @round.turns, @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
  end

  def test_number_correct
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
    @round.take_turn("Mars")
    assert_equal 2, @round.number_correct
    #Test for wrong answer.
    @round.take_turn("West")
    assert_equal 2, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    @round.take_turn("West")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 1, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    @round.take_turn("West")
    assert_equal 66.67, @round.percent_correct
  end

  def test_total_cards_per_category
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    @round.take_turn("West")
    assert_equal 1, @round.total_cards_per_category(:Geography)
    assert_equal 2, @round.total_cards_per_category(:STEM)
    assert_equal 0, @round.total_cards_per_category("POP Culture")
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    @round.take_turn("West")
    @round.take_turn("Japan")
    assert_equal 100.00, @round.percent_correct_by_category(:Geography)
    assert_equal 50.00, @round.percent_correct_by_category(:STEM)
    assert_equal 0.00, @round.percent_correct_by_category(:Indonesia)
  end
end
