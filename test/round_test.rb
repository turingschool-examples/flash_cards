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
     @cards = [@card_1, @card_2, @card_3]
     @deck = Deck.new(@cards)
     @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_turns_initial
    assert_equal [], @round.turns
  end

  def test_it_has_current_card_initial
    assert_equal @card_1, @round.current_card
  end

  def test_method_take_turn_returns_Turn
    assert_instance_of Turn, @round.take_turn("Juneau") #assert_equal does not give usable information
  end

  def test_method_count
    @round.take_turn("Juneau")
    assert_equal 1, @round.turns.count
  end

  def test_method_last
    turn = @round.take_turn("Juneau")
    assert_equal turn,@round.turns.last
  end

  def test_method_number_correct
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_method_number_correct_by_category_Geography
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_method_number_correct_by_category_STEM
   @round.take_turn("Juneau")
   assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_method_percent_correct
   @round.take_turn("Juneau")
   @round.take_turn("Earth")
   assert_equal 50.0, @round.percent_correct
  end

  def test_method_percent_correct_by_category_Geography
   @round.take_turn("Juneau")
   @round.take_turn("Earth")
   assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

  def test_it_has_current_card_1turn
   @round.take_turn("Juneau")
   assert_equal @card_2, @round.current_card
  end

end
