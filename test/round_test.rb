require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
    @first_turn = @round.take_turn("Juneau")
    @second_turn = @round.take_turn("Venus")
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_card_array_exists
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_current_card_exists
    assert_equal @card_1, @deck.cards[0]
  end

  def test_if_take_turn_method_has_a_turn_class
    assert_equal Turn, @round.take_turn("Juneau").class
  end

  def test_it_has_a_turns_collection
    assert_equal [@card_1, @card_2], @round.turns.map { |turn| turn.card }
  end

  def test_it_has_a_number_correct
    assert_equal 1, @round.number_correct
  end

  def test_it_has_a_number_correct_by_category
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_it_has_a_percent_correct
    assert_equal 50.0, @round.percent_correct
  end

  def test_it_has_a_percent_correct_by_category
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

end
