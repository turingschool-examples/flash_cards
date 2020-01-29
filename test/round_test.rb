require_relative 'test_helper'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [@card_1, @card_2, @card_3]

    @deck = Deck.new(cards)
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_round_has_a_deck
    assert_instance_of Deck, @round.deck
    assert_equal @deck, @round.deck
    assert_equal 3, @round.deck.cards.length
  end

  def test_round_starts_with_empty_turns_array
    assert_equal [], @round.turns
  end

  def test_deck_has_and_starts_with_first_card
    assert_instance_of Card, @round.current_card
    assert_equal @card_1, @round.current_card
  end

  def test_round_take_turn_method
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
    assert new_turn.correct?
    assert_equal [new_turn], @round.turns
  end

  def test_round_logs_number_correct
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_round_moves_to_next_card_after_turn
    @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
    assert @round.current_card
  end

  def test_round_takes_more_than_one_turn
    assert_equal [], @round.turns
    assert_equal 0, @round.turns.count
    assert_equal @card_1, @round.current_card

    new_turn_1 = @round.take_turn("Juneau")
    assert_equal [new_turn_1], @round.turns
    assert_equal 1, @round.turns.count
    assert_equal "Correct", @round.turns.last.feedback
    assert_equal @card_2, @round.current_card


    new_turn_2 = @round.take_turn("Venus")
    assert_equal [new_turn_1, new_turn_2], @round.turns
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect", @round.turns.last.feedback
  end

  def test_round_number_correct_method
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct

    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_round_percent_correct_method
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct
  end

  def test_round_percent_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct_by_category(:Geography)
    assert_equal 0, @round.percent_correct_by_category(:STEM)
  end

  def test_round_current_card_moves_to_last_card
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    
    assert_equal @card_3, @round.current_card
  end
end
