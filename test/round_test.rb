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
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_attributes
    assert_equal @deck, @round.deck
    assert_equal [], @round.turns
  end

  def test_it_takes_turns
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
    assert new_turn.correct?
    assert_equal [new_turn], @round.turns
  end

  def test_value_of_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_number_of_correct_guesses
    new_turn = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    new_turn = @round.take_turn("Juneau")

    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    new_turn = @round.take_turn("Juneau")

    @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    new_turn = @round.take_turn("Juneau")

    @round.take_turn("Venus")
  
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end
end
