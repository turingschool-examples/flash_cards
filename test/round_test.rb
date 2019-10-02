require 'minitest/autorun'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  # define setup
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

  def test_deck_values
    assert_instance_of Deck, @round.deck
  end

  def test_current_card
    assert_equal @round.current_card, @card_1
  end

  def test_new_turn_juneau_class
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
  end

  def test_new_turn_juneau_correct?
    new_turn = @round.take_turn("Juneau")
    assert_equal true, new_turn.correct?
  end

  def test_new_turn_juneau_feedback
    new_turn = @round.take_turn("Juneau")
    assert_equal "Correct!", new_turn.feedback
  end

  def test_new_turn_juneau_round_turns
    skip
    new_turn = @round.take_turn("Juneau")
    assert_equal @round.turns
  end

  def test_new_turn_juneau_number_correct
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_new_turn_juneau_current_card
    new_turn = @round.take_turn("Juneau")
    assert_equal @round.current_card, @card_2
  end

  def test_take_turn_venus_count_turns
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_take_turn_venus_round_last_feedback
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_take_turn_venus_round_number_correct
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_take_turn_venus_number_correct_geography
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_take_turn_venus_number_correct_STEM
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_take_turn_venus_percent_correct
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct
  end

  def test_take_turn_venus_percent_correct_geography
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

  def test_take_turn_venus_current_card
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal @card_3, @round.current_card
  end

end
