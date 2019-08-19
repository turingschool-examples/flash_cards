require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

# processes responses
# records guesses
class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_attributes
    # turns in a round are represented by an array
    assert_equal [], @round.turns
    # a round is initialized with a deck
    assert_equal @deck, @round.deck
  end

  def test_current_card
    # current card starts round, is first card in deck's array of cards
    assert_equal @card_1, @round.current_card
  end

# takes a string representing the guess
  def test_take_turn
    @round.take_turn("Juneau")
    # stores and returns new Turn from the take_turn method
    assert_equal [@round.take_turn("Juneau")], @round.turns
    # Round moves to the next card in the deck when take_turn method is called
    assert_equal @card_2, @round.current_card
  end

  def test_class
    # method takes string representing the guess
    # creates a new Turn object with the respective guess and Card
    new_turn = @round.take_turn("Juneau")

    assert Turn, new_turn.class
  end

  def test_correct_answer
    new_turn = @round.take_turn("Juneau")

    assert new_turn.correct?
  end

  def test_turns
    assert_equal [], @round.turns
  end

  def test_number_correct_answers
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert 1, @round.number_correct
  end

  def test_turns_count
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 2, @round.turns.count
  end

  def test_returns_feedback
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_number_if_correct_by_category_2
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_cateogory
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end
end
