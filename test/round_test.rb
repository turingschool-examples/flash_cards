require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("What is my name?", "David", :Personal)
    @card3 = Card.new("What is 30 * 30", "900", :Math)
    @card4 = Card.new("What is the mile high city", "Denver", :Geography)
    @cards = [@card1, @card2, @card3, @card4]
    @deck1 = Deck.new(@cards)
    @turn = Turn.new("Juneau", @card)
    @round1 = Round.new(@deck1)
  end

  def test_it_exists
    assert_instance_of Round, @round1
  end

  def test_it_has_deck
    assert_equal @deck1, @round1.deck
  end

  def test_if_it_makes_turn
    @round1.take_turn("Juneau")
    assert_instance_of Turn, @round1.turns[0]
  end

  def test_if_turn_goes_to_turns
    @round1.take_turn("Juneau")
    assert_equal 1, @round1.turns.count
  end

  def test_if_cards_remove
    @round1.take_turn("Juneau")
    assert_equal 3, @round1.deck.count
  end

  def test_if_correct_is_true
    @round1.take_turn("Juneau")
    @round1.correct?
    assert true
  end

  def test_if_correct_is_false
    @round1.take_turn("Incorrect")
    @round1.correct?
    refute false
  end

  def test_number_correct
    @round1.take_turn("Incorrect")
    assert_equal 0, @round1.number_correct
  end
end
