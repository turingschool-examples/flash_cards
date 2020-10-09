require "minitest/autorun"
require "minitest/pride"
require "./lib/round"
require "./lib/card"
require "./lib/turn"
require "./lib/deck"

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_it_exists_and_has_attributes
    assert_equal @deck, @round.deck
  end

  def test_it_has_turns
    assert_equal [], @round.turns
  end

  def test_it_can_find_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_can_take_a_new_turn
    new_turn = @round.take_turn("Juneau")
    assert_equal Turn, new_turn.class
    assert_equal true, new_turn.correct?
    assert_equal [new_turn], @round.turns
  end

  def test_it_can_find_number_of_correct_guesses
    new_turn = @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_it_has_another_turn
    new_turn = @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect.", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
  end
end
