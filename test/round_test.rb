require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Saturn", @card_2)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_turns_method
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
    assert_equal @card_2, @round.current_card
    assert_equal @card_3, @round.current_card
  end

  # def test_take_turn_method
  #   assert_equal @turn_1, @round.take_turn("Juneau")
  #   assert_equal @turn_2, @round.take_turn("Venus")
  # end

  def test_class
    new_turn_1 = @round.take_turn("Juneau")

    assert Turn, new_turn_1.class
  end

  def test_correct
    new_turn_1 = @round.take_turn("Juneau")

    assert new_turn_1.correct?
  end

  def test_turns
    assert_equal [], @round.turns
  end

  def test_number_correct
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert 1, @round.number_correct
  end

  def test_turns_count
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert_equal 2, @round.turns.count
  end

  def test_turns_last_feedback
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_correct_by_category
    
  end
end
