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
    #binding.pry
    assert_instance_of Card, @round.current_card
  end

  def test_it_has_a_turn
    assert_instance_of Turn, @turn
  end

  def test_it_takes_a_turn
    turn = Turn.new("Juneau", @card_1)
    assert_equal "Juneau", @round.take_turn(turn.guess)
  end

  def test_it_takes_more_turns
    assert_equal "Juneau", @round.take_turn("Juneau").guess
    assert_equal "Mars", @round.take_turn("Mars").guess
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

  def test_it_has_round_number_correct
    assert_equal 1, @round.round_count
  end

  def test_it_took_out_card
    @round.take_turn("Juneau")
    #binding.pry
    assert_equal @card_1, @round.current_card
  end

  def test_it_counts_many_turns
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 3, @round.round_count
  end

  def test_feedback_for_incorrect
    #binding.pry
    @round.take_turn("Juneau")
    assert_equal "Sorry, that is incorrect.", @round.take_turn("Venus")
  end

  def test_it_has_number_correct
    @round.take_turn("Juneau")
    assert_equal 1, @round.correct_guess_counter
  end
end
