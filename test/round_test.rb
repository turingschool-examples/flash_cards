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

  def test_round_exists_with_deck_and_starts_with_first_card
    assert_instance_of Round, @round
    assert_instance_of Deck, @round.deck
    assert_equal 3, @round.deck.cards.length
    assert_equal @card_1, @round.current_card
  end

  def test_round_starts_with_empty_array_and_can_take_more_than_one_turn
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

  def test_round_take_turn_method
    new_turn_1 = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn_1
    assert new_turn_1.correct?
    assert_equal [new_turn_1], @round.turns
    assert_equal 1, @round.flip

    new_turn_2 = @round.take_turn("Venus")
    assert_instance_of Turn, new_turn_2
    refute new_turn_2.correct?
    assert_equal [new_turn_1, new_turn_2], @round.turns
    assert_equal 2, @round.flip
  end

  def test_round_can_get_number_correct
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct

    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct

    @round.take_turn("North north west")
    assert_equal 2, @round.number_correct
  end

  def test_round_moves_to_next_card_after_turn
    @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card

    @round.take_turn("Venus")
    assert_equal @card_3, @round.current_card

    @round.take_turn("North north west")
    assert_nil @round.current_card
  end

  def test_round_number_correct_method
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct

    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct

    @round.take_turn("North north west")
    assert_equal 2, @round.number_correct
  end

  def test_round_number_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)

    @round.take_turn("Venus")
    assert_equal 0, @round.number_correct_by_category(:STEM)

    @round.take_turn("North north west")
    assert_equal 1, @round.number_correct_by_category(:STEM)
  end

  def test_round_percent_correct_method
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct

    @round.take_turn("North north west")
    assert_equal 67, @round.percent_correct
  end

  def test_round_percent_correct_by_category
    @round.take_turn("Juneau")
    assert @round.percent_correct_by_category.include?(:Geography)
    assert_equal 100,  @round.percent_correct_by_category[:Geography]
    refute @round.percent_correct_by_category.include?(:STEM)
    assert_nil  @round.percent_correct_by_category[:STEM]

    @round.take_turn("Mars")
    assert @round.percent_correct_by_category.include?(:Geography)
    assert_equal 100,  @round.percent_correct_by_category[:Geography]
    assert @round.percent_correct_by_category.include?(:STEM)
    assert_equal 100,  @round.percent_correct_by_category[:STEM]

    @round.take_turn("North northest")
    assert @round.percent_correct_by_category.include?(:Geography)
    assert_equal 100,  @round.percent_correct_by_category[:Geography]
    assert @round.percent_correct_by_category.include?(:STEM)
    assert_equal 50,  @round.percent_correct_by_category[:STEM]
  end
end
