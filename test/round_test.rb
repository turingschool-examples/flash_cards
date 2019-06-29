require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck'
require './lib/turn.rb'
require './lib/round.rb'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_that_round_exists

  assert_instance_of Round, @round
  end

  def test_that_round_has_deck

    assert_instance_of Deck, @round.the_deck
  end
  def test_that_round_has_turns

    assert_equal [], @round.turns
  end

  def test_show_current_card

    assert_equal @card_1, @round.current_card
  end

  def test_take_turn

    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_is_new_turn_correct

    assert_equal true, @round.take_turn("Juneau").correct?
  end

  def test_check_what_is_current_turn
    turn_1 = Turn.new("Juneau", @card_1)
    @round.take_turn("Juneau")
    assert_instance_of Turn, @round.turns.last
    assert_equal 1, @round.turns.length
  end

  def test_check_number_correct

    turn_1 = Turn.new("Juneau", @card_1)
    @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_show_current_card_2
    turn_2 = Turn.new("Venus", @card_2)
    @round.take_turn("Venus")
    assert_equal @card_2, @round.current_card
  end

  def test_current_count

    turn_1 = Turn.new("Juneau", @card_1)
    turn_2 = Turn.new("Venus", @card_2)
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_is_second_guess_correct

    turn_1 = Turn.new("Juneau", @card_1)
    turn_2 = Turn.new("Venus", @card_2)
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

  assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_of_guesses_correct
    turn_1 = Turn.new("Juneau", @card_1)
    turn_2 = Turn.new("Venus", @card_2)
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category_geography

    turn_1 = Turn.new("Juneau", @card_1)
    turn_2 = Turn.new("Venus", @card_2)
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_number_correct_by_category_geography

    turn_1 = Turn.new("Juneau", @card_1)
    turn_2 = Turn.new("Venus", @card_2)
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_what_is_percent_correct

    turn_1 = Turn.new("Juneau", @card_1)
    turn_2 = Turn.new("Venus", @card_2)
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end
end
