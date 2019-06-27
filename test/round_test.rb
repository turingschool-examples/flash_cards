require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

class RoundTest < MiniTest::Test
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

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_it_has_no_turns_to_start
    assert_equal [], @round.turns
  end

  def test_it_gets_a_card_for_current_turn
    assert_equal @card_1, @round.current_card
  end

  def test_new_turn_is_a_turn_object
    assert_equal Turn, @round.take_turn("Juneau").class
  end

  def test_the_turn_guess_is_correct_if_it_should_be
    assert @round.take_turn("Juneau").correct?
  end

  def test_the_turn_guess_is_incorrect_if_it_should_be
    refute @round.take_turn("Anchorage").correct?
  end

  def test_the_new_turn_is_moved_to_turns_array
    assert_equal [@round.take_turn("Juneau")], @round.turns
  end

  def test_the_number_correct_is_1_after_1_correct_answer
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_the_number_correct_is_3_after_3_correct_answers
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    @round.take_turn("North north west")
    assert_equal 3, @round.number_correct
  end

  def test_it_gets_a_new_current_card_after_a_turn
    @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
  end

  def test_it_can_count_the_cards_correct_by_category
    @round.take_turn("Juneau") # => correct
    @round.take_turn("Venus") # => incorrect
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
    @round.take_turn("North north west") # => correct
    assert_equal 1, @round.number_correct_by_category(:STEM)
  end

end
