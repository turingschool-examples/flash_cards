require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
    @new_turn = @round.take_turn("Juneau")

  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_the_deck
    assert_instance_of Deck, @round.deck
  end

  def test_class
    assert Turn
  end

  def test_number_correct
    skip
    assert_equal 1, @round.number_correct
  end

  def test_take_turn
    assert Turn, @round.take_turn("Venus")
  end

  def test_number_correct_by_category
    assert_equal 1, @round.test_number_correct_by_category(:Geography)
  end

  def test_number_correct_by_category
    assert 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    skip
    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end
end
