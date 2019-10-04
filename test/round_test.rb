require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @turn = Turn.new("Juneau", @card_1)

  end

  def test_it_has_a_deck
    assert_instance_of Deck, @deck
  end

  def test_it_has_cards
    assert_equal 3, @cards.count
  end

  def test_it_has_a_round
    assert_instance_of Round, @round
  end

  def test_it_has_turns
     assert_equal [], @round.turns
  end

  def test_it_has_a_card
    assert_instance_of Card, @round.current_card
  end

  def test_it_has_a_turn
    assert_instance_of Turn, @turn
  end

  def test_it_takes_a_turn
    turn = @round.take_turn("Juneau")
    assert_instance_of Turn, turn
  end

  def test_it_takes_more_turns
    turn = @round.take_turn("Juneau")
    assert_instance_of Turn, turn
    assert_equal @card_1, turn.card
    assert_equal "Juneau", turn.guess

    turn_2 = @round.take_turn("Saturn")
    assert_instance_of Turn, turn_2
    assert_equal @card_2, turn_2.card
    assert_equal "Saturn", turn_2.guess
  end

  def test_it_is_a_turn
    assert_equal Turn, @turn.class
  end

  def test_it_is_correct
    assert_equal true, @turn.correct?
  end

  def test_turns_is_an_array
    assert_equal @cards.class, @round.turns.class
  end

  def test_it_has_number_correct_and_turn_count_and_feedback
    @round.take_turn("Juneau")
    assert_equal 1, @round.turns.count
    assert_equal "Correct!", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
  end

  def test_number_coorect_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Saturn")
    @round.take_turn("North north west")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 1, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Saturn")
    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Saturn")
    @round.take_turn("North north west")
    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
  end
end
