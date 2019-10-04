# round_test.rb
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
#require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    # @card_1 used in test_it_has_a_current_card
    cards = [@card_1, card_2, card_3]
    @deck = Deck.new(cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_no_turns
    assert_equal [], @round.turns
    # assertion method that tests if object is empty
    # @rounds.turns is an array, does this work?
  end

  def test_it_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_takes_a_turn
    assert_instance_of Turn, @round.take_turn("Juneau")
  end

  def test_it_counts_number_correct
    # test that correct count starts at 0
    assert_equal 0, @round.number_correct
    # test that if a guess is correct it counts
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
    # test it doesn't count incorrect guesses
    new_turn = @round.take_turn("Juneau") # correct answer "Mars"
    assert_equal 1, @round.number_correct
    # test it counts more than 1 correct answer
    new_turn = @round.take_turn("North north west")
    assert_equal 2, @round.number_correct
  end
end
