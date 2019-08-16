require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
    @turn_1 = Turn.new("Juneau", @card_1)
    # @new_turn = @round.take_turn("Juneau")

    # @turns = []
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_deck
    assert_equal @deck, @round.deck
  end

  def test_turns
    assert_equal [], @round.turns
  end

  def test_go_to_next_card
    assert_equal @card_1, @round.go_to_next_card
    assert_equal @card_2, @round.go_to_next_card
  end

  def test_curent_card
    assert_equal @card_1, @round.current_card
    @round.go_to_next_card
    assert_equal @card_2, @round.current_card
    @round.go_to_next_card
    assert_equal @card_3, @round.current_card
  end

  def test_take_turn
    new_turn = @round.take_turn("Juneau")
    assert_equal [new_turn], @round.turns
    assert_equal Turn, new_turn.class
    assert new_turn.correct?
    new_turn_2 = @round.take_turn("Venus")
    assert_equal [new_turn, new_turn_2], @round.turns
    # @round.go_to_next_card
    refute new_turn_2.correct?
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect!", @round.turns.last.feedback
    assert_equal 1, @round.number_correct

    # binding.pry
  end

  # def test_new_turn_class
  #   new_turn = @round.take_turn("Juneau")
  #   assert_equal Turn, new_turn.class
  # end

  # def test_turns_taken
  #   new_turn = @round.take_turn("Juneau")
  #
  #   assert_equal [@card_1], @round.turns
  # end

  def test_number_correct
    @round.take_turn"Juneau"
    assert_equal 1, @round.number_correct
  end

  # def test_number_correct_by_category
  #   assert_equal 1, @round.test_number_correct_by_category(:Geography)
  # end
end
