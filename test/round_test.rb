require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require "pry"


class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
       and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5°
       clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @turns =[]
    @round = Round.new(@deck)
  end #end setup

  def test_if_deck_and_round_exist #pry 1-9
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

  def test_if_new_turn_has_class
    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
    assert_equal true, new_turn.correct?
  end

  def test_new_turns_array
    new_turn = @round.take_turn("Juneau")

    assert_equal [new_turn], @round.turns
  end

  def test_for_number_correct
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.amount_correct
  end

  def test_for_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_for_percent_correct_overall
      @round.take_turn("Juneau")
      assert_equal 100, @round.percent_correct
      @round.take_turn("oops")
      assert_equal 50, @round.percent_correct
  end


  def test_for_percent_by_category
    @round.take_turn("Juneau")
    assert_equal 100, @round.percent_correct_category(:Geography)
    assert_equal 0, @round.percent_correct_category(:STEM)
  end


end  #end class
