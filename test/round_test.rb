# round_test.rb
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card'
require_relative '../lib/deck'
require_relative '../lib/round'

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

  def test_it_counts_number_correct_by_category
    # test that correct count starts at 0
    assert_equal 0, @round.number_correct_by_category(:STEM)
    # test that if a guess is correct in another category
    # does not count in another category
    new_turn = @round.take_turn("Juneau")
    assert_equal 0, @round.number_correct_by_category(:STEM)
    # test it counts when there is a correct guess in the category
    new_turn = @round.take_turn("Mars")
    assert_equal 1, @round.number_correct_by_category(:STEM)
    # test that random category returns 0 number correct
    assert_equal 0, @round.number_correct_by_category(:CHEMISTRY)
  end

  def test_it_has_a_percent_correct
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Mars")
    new_turn = @round.take_turn("Mars")
    assert_equal (2/3.0 * 100), @round.percent_correct
    # 2 of 3 questions correct should return 2/3 percent
  end

  def test_it_has_percent_correct_by_category
    # asked one question in category, guessed correctly
    new_turn = @round.take_turn("Juneau") #:G eography
    new_turn = @round.take_turn("Mars") #:STEM
    assert_equal 100, @round.percent_correct_by_category(:STEM)
    # if the user gets a wrong guess and a correct guess
    new_turn = @round.take_turn("Mars") #:STEM
    assert_equal 50, @round.percent_correct_by_category(:STEM)

  end
end
