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

  def test_it_has_a_deck
    assert_equal @deck, @round.deck
  end

  def test_round_has_turns
    assert_equal [], @round.turns
  end

  def test_it_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_can_take_turn
    new_turn = @round.take_turn("Juneau")

    assert_equal "Juneau", @round.turns.last.card.answer
  end

  def test_the_number_of_correct_answers
     new_turn = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_the_number_of_correct_answers_by_category
    new_turn = @round.take_turn("Juneau")
    nex_turn = @round.take_turn("North north west")

    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_the_percent_of_correct_numbers
    new_turn = @round.take_turn("Juneau")
    nex_turn = @round.take_turn("Snow")

    assert_equal 5.0, @round.percent_correct
  end

  def test_the_percent_of_correct_numbers_by_category
    new_turn = @round.take_turn("Juneau")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end
end
