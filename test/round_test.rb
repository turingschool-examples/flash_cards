require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
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
    binding.pry
  end
  def test_round_exists

    assert_instance_of Round, @round
  end

  def test_it_has_deck

    assert_equal @deck, @round.deck
  end

  def test_it_has_turns

    assert_equal [], @round.turns
  end

  def test_it_has_current_card

    assert_equal @card_1, @round.current_card
  end

  def test_it_has_class
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
    assert new_turn.correct?
  end

  def test_it_adds_to_turns
    new_turn = @round.take_turn("Juneau")

    assert_equal [new_turn], @round.turns
  end

  def test_it_counts_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Mars")

    assert_equal 2, @round.number_correct
  end

  def test_it_can_change_current_card

    @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_new_count
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect.", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
    assert_equal 50.0, @round.percent_correct
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    assert_equal @card_3, @round.current_card
  end
end
