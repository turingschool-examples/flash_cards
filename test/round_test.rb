require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'


class Roundtest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_turns_exists_in_round
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_new_turn
    new_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
    assert_equal Turn, new_turn.class
    assert_equal true, new_turn.correct?
    assert_equal new_turn, @round.turns[0]
    assert_equal 1, @round.number_correct
    new_turn = @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    assert_equal 1 , @round.number_correct_by_category(:Geography)
    @round.take_turn("cheese")
    assert_equal 0 ,@round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    assert_equal 1 , @round.number_correct_by_category(:Geography)
    @round.take_turn("cheese")
    assert_equal 0 ,@round.number_correct_by_category(:STEM)
    assert_equal 50, @round.percent_correct
  end

  

end
