require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require "pry"

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

  def test_deck
    assert_equal @deck, @round.deck
  end

  def test_initial_turns
    assert_equal [], @round.turns
  end

  def test_current_card_1
    assert_equal @card_1, @round.current_card
  end

  def test_current_card_index
    assert_equal 0, @round.current_card_index
  end

  def test_take_turn_1
    turn_1 = @round.take_turn("10")
    assert_equal "10", turn_1.guess
    assert_instance_of Turn, turn_1
    assert turn_1.correct?
    assert_equal 1, @round.turns.size
    assert_equal 1, @round.number_correct
    assert_equal 1, @round.number_correct_by_category(:Math)
    assert_equal 0, @round.number_correct_by_category(:Science)
  end

  def test_turn_1_correct
    skip
  end

  def test_turns_array_1
    skip
  end

  def test_number_correct_1
    skip
  end

  def test_current_card_2
    skip
  end

  def test_turns_count
    skip
  end

  def test_turns_last_feedback
    skip
  end

  def test_number_correct_2
    skip
  end

  def test_number_correct_by_category_1
    skip
  end

  def test_number_correct_by_category_2
    skip
  end

  def test_percent_correct
    skip
  end

  def test_percent_correct_by_category_1
    skip
  end

  def test_current_3
    skip
  end

end
