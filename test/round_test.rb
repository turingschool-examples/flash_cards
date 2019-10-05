require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @turn = Turn.new("", @card_1)
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_initialize
    assert_instance_of Round, @round
  end

  def test_turns
    skip
    assert_equal [], @round.turns
  end

  def test_current_card
    skip
    assert_equal "What is the capital of Alaska?", "Juneau", :Geography, @card_1
  end

  def test_take_turn
    
  end

  def test_take_turn
    assert_equal [], @round.turns
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn.class
    assert_equal true, new_turn.correct?
    assert_equal [new_turn], @round.turns
  end

  def test_number_correct
    # tells number of turns that are correct (.length? on turns? part of turns that is correct, two arrays?)
  end

  def test_number_correct_by_category()
    # tells number of Turns correct, by category
    # look at arrays built elsewhere, and Deck class's cards_in_category method
  end

  def test_total_percent_correct
    # number correct divided by total, multiply by 100
    # format returned message
  end

  def test_percent_correct_by_category
    # number correct by categoy, multiply by 100
    # format returned message
  end



end
