require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("What is the tallest mountain in Russia?", "Mount Elbrus", :Geography)
    @card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_4 = Card.new("Where is the world's largest living aspen grove?", "Utah", :STEM)
    @card_5 = Card.new("How many paintings did Vincent Van Gogh sell during his lifetime?", "1", :Art)
    @card_6 = Card.new("What Spanish painter is often referred to as both the last of the Old Masters and the first of the moderns?", "Francisco de Goya", :Art)

    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_initialize
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_new_turn_exists
    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
  end

  def test_guess_correct
    new_turn = @round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_turn_can_be_recorded
    new_turn_1 = @round.take_turn("Juneau")
    assert_equal [new_turn_1], @round.turns

    new_turn_2 = @round.take_turn("Mount Everest")
    assert_equal [new_turn_1, new_turn_2], @round.turns
  end

  def test_number_of_guesses_correct
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Mount Everest")

    assert_equal 1, @round.number_correct
  end

  def test_cards_in_deck_can_be_shifted
    new_turn_2 = @round.take_turn("Mount Everest")

    assert_equal @card_2, @round.current_card
  end

  def test_number_of_turns_taken
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Mount Everest")

    assert_equal 2, @round.turns.count
  end

  def test_feedback_of_last_card_in_deck
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Mount Everest")

    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_of_guesses_correct_by_category
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Mount Everest")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:Art)
  end

  def test_percent_correct
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Mount Everest")
    
    assert_equal 50.0, @round.percent_correct
  end
end
