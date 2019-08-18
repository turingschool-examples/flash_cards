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
    @card_3 = Card.new("Describe in words the exact direction that is 697.5 clockwise from due north?", "North north west", :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])

    @round = Round.new(@deck)
  end

# The take_turn method is the crux of this problem.
# The take_turn method takes a string representing the guess.
# It should create a new Turn object with the appropriate guess and Card.
# It should store this new Turn, as well as return it from the take_turn method.
# Also, when the take_turn method is called, the Round should move on to the next card in the deck.

  def test_round_exits
    assert_instance_of Round, @round
  end

  def test_turns
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn
    new_turn = @round.take_turn("Juneau")

    assert @round.take_turn("Juneau")
  end

  def test_new_turn_class
    new_turn = @round.take_turn("Juneau")

    assert_equal Turn, new_turn.class
  end

  def test_if_new_turn_is_correct
    new_turn = @round.take_turn("Juneau")

    assert new_turn.correct?
  end

  def test_new_turn_returns_in_array
    new_turn = @round.take_turn("Juneau")

    assert_equal [new_turn], @round.turns
  end

  def test_after_new_turn_number_correct
    new_turn= @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_take_turn_returns_next_card
    first_turn = @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_count_number_correct
    assert_equal 0, @round.number_correct

    correct_turn = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct

    incorrect_turn = @round.take_turn("Saturn")

    assert_equal 1, @round.number_correct
  end
  # def test_turn_2_count
  # end
  #
  # def test_turn_2_feedback
  # end
  #
  # def test_if_turn_2_is_correct
  # end
  #
  # def test_after_turn_2_number_correct
  # end
  #
  # def test_number_correct_by_category_geography
  # end
  #
  # def test_number_correct_by_category_stem
  # end
  #
  # def test_percent_correct
  # end
  #
  # def test_percent_correct_by_category_geography
  # end
  #
  # def test_current_card_3
  # end
end
