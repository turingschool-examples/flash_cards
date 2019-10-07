require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/card'
require './lib/deck'
require './lib/turn'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @current_card = @deck.cards.first
    @turns = []
  end

  def test_it_exists
    round = Round.new(@deck)
    assert_instance_of Round, round
  end

  def test_deck_exists
    round = Round.new(@deck)
    assert_instance_of Deck, round.deck
  end

  def test_turns_exist
    round = Round.new(@deck)
    assert_equal round.turns, []
  end

  def test_current_card
    round = Round.new(@deck)
    assert_instance_of Card, round.current_card
  end

  def test_take_turn
    round = Round.new(@deck)
    assert_instance_of Turn, round.take_turn("Juneau")
  end

  def test_turn_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    assert true
  end

  def test_deck_cards_rotate
    round = Round.new(@deck)
    round.take_turn("Juneau")
    assert_equal "Mars", @deck.cards.first.answer
  end

  def test_number_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    assert_equal 1, round.number_correct
  end

  def test_number_correct_by_category
    round = Round.new(@deck)
    round.take_turn("Juneau")
    assert_equal 1, round.number_correct_by_category(:Geography)
  end

  def test_percent_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    assert_equal 100.0, round.percent_correct
  end

  def test_percent_correct_category
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("Wrong_Answer")
    assert_equal 50.0, round.percent_correct_by_category(:STEM)
  end

end
