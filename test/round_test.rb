require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

## CHECK ITERATION PATTERN IN INSTRUCTIONS

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_card_1
    skip
  end

  def test_card_2
    skip
  end

  def test_card_3
    skip
  end

  def test_deck_var
    skip
  end

  def test_round
    assert_instance_of Round, @round
  end

  def test_deck_method
    assert_equal @deck, @round.deck
  end

  def test_turn_1
    skip
  end

  def test_current_card_1
    assert_equal @round.current_card, @card_1
  end

  def test_take_turn_1
    turn = @round.take_turn("Juneau")

    assert @round.turns.count == 1
    assert_equal @round.current_card, @card_2
  end

  def test_turn_class
    skip
  end

  def test_turn_correct
    skip
  end

  def test_turn_2
    skip
  end

  def test_number_correct_1
    skip
  end

  def test_current_card_2
    skip
  end

  def test_take_turn_2
    skip
  end

  def test_turn_count
    skip
  end

  def test_turn_last_feedback
    skip
  end

  def test_number_correct_2
    skip
  end

  def test_number_correct_by_category_1
    skip
  end

  def test_number_correct_by_category_2
    skip
  end

  def test_percent_correct
    skip
  end

  def test_percent_correct_by_cateogry
    skip
  end

  def test_current_card_3
    skip
  end

end
