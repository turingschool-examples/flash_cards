require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("5 + 5 = ", "10", :Math)
    @card_2 = Card.new("7 * 6 = ", "42", :Math)
    @card_3 = Card.new("H2O is", "water", :Science)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_initial_attributes
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_can_add_turns_to_turns_array
    @round.take_turn("10")
    assert_equal 1, @round.turns.length
    assert_equal @card_1, @round.turns[0].card
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
    @round.take_turn("10")
    assert_equal @card_2, @round.current_card
  end

  def test_current_card_index
    assert_equal 0, @round.current_card_index
    @round.take_turn("10")
    assert_equal 1, @round.current_card_index
  end

  def test_take_turn_1
    turn_1 = @round.take_turn("10")
    assert_instance_of Turn, turn_1
    assert_equal "Correct!", @round.turns.last.feedback
  end

  def test_number_correct
    @round.take_turn("10")
    assert_equal 1, @round.number_correct
    @round.take_turn("49")
    assert_equal 1, @round.number_correct
    @round.take_turn("water")
    assert_equal 2, @round.number_correct
  end

  def number_correct_by_category
    @round.take_turn("10")
    assert_equal 1, @round.number_correct_by_category(:Math)
    assert_equal 0, @round.number_correct_by_category(:Science)
    @round.take_turn("49")
    assert_equal 1, @round.number_correct_by_category(:Math)
    assert_equal 0, @round.number_correct_by_category(:Science)
    @round.take_turn("water")
    assert_equal 1, @round.number_correct_by_category(:Math)
    assert_equal 1, @round.number_correct_by_category(:Science)
  end

  def test_percent_correct
    @round.take_turn("10")
    assert_equal 100.0, @round.percent_correct
    @round.take_turn("49")
    assert_equal 50.0, @round.percent_correct
    @round.take_turn("water")
    assert_equal 66.7, @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("10")
    assert_equal 100.0, @round.percent_correct_by_category(:Math)
    assert_equal 0.0, @round.percent_correct_by_category(:Science)
    @round.take_turn("49")
    assert_equal 50.0, @round.percent_correct_by_category(:Math)
    assert_equal 0.0, @round.percent_correct_by_category(:Science)
    @round.take_turn("water")
    assert_equal 50.0, @round.percent_correct_by_category(:Math)
    assert_equal 100.0, @round.percent_correct_by_category(:Science)
  end
end
