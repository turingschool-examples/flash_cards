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
    @cards = [@card_1, @card_2, @card_3]

    @turn_1 = Turn.new("Juneau", @card_1)
    @turn_2 = Turn.new("Venus", @card_2)
    @turn_3 = Turn.new("North north west", @card_3)

    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_deck_exists
    assert_instance_of Deck, @deck
  end

  def test_card_exists
    assert_instance_of Card, @card_1
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_class
    assert_equal Turn, @turn_1.class
  end

  def test_new_turn_correct
    assert_equal true, @turn_1.correct?
  end

  def test_turns_exists
    assert_instance_of Array, @round.turns
  end

  def test_take_turn
    # test card gets shoveled into @turn array
    # test original deck no longer has first card
    # test something else?
  end

  def test_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")
    assert_equal 2, @round.number_correct
  end

  def test_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")
    assert_equal 66, @round.percent_correct
  end

  def test_number_of_cards_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")
    assert_equal 2, @round.number_of_cards_by_category(:STEM)
  end

  def test_percent_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")
    assert_equal 50, @round.percent_correct_by_category(:STEM)
  end

  def test_cards_in_discard
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")
    assert_equal [@card_1, @card_2, @card_3], @round.cards_in_discard
  end
end
