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
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_deck_in_round
    assert_equal @deck, @round.deck
  end

  def test_turns_in_round
    assert_equal [], @round.turns
  end

  def test_current_card
    assert_equal [@card_1], [@round.current_card]
  end

  def test_turn_class
    assert_equal Turn, @round.take_turn("Juneau").class
  end

  def test_turn_correct
    assert @round.take_turn("Juneau").correct?
    refute @round.take_turn("Juneau").correct?
  end

  def test_turns
    assert_equal [@round.take_turn("Juneau")], @round.turns
  end

  def test_number_correct
    turn = @round.take_turn("Juneau")

    assert_equal 1, @round.number_correct
  end

  def test_current_card
    turn_1 = @round.take_turn("Juneau")
    turn_2 = @round.take_turn("Venus")

    assert [@card_2]
    assert_equal [@card_3], [@round.current_card]
    assert_equal 2, @round.turns.count
    assert_equal "Incorrect.", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    turn_1 = @round.take_turn("Juneau")
    turn_2 = @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    turn_1 = @round.take_turn("Juneau")
    turn_2 = @round.take_turn("Venus")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

  def test_current_card_third_card
    turn_1 = @round.take_turn("Juneau")
    turn_2 = @round.take_turn("Venus")

    assert_equal @card_3, @round.current_card
  end

end
