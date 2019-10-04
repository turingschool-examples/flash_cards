require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/turn'
require './lib/card'
require './lib/deck'

class RoundTest < Minitest::Test
  def setup
    card_1 = Card.new("What is the sum of 5 + 5?", 10, :Math)
    card_2 = Card.new("What is the sum of 5 + 10?", 15, :Math)
    card_3 = Card.new("Capital of Colorado?", "denver", :Geography)
    card_4 = Card.new("Capital of New York?", "albany", :Geography)
    @cards = [card_1, card_2, card_3, card_4]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_for_instance

    assert_instance_of Round, @round
  end

  def test_for_deck

    assert_equal @deck, @round.deck
  end

  def test_for_first_card

    assert_equal @cards[0], @round.current_card
  end

  def test_for_second_card
    @round.take_turn(15)

    assert_equal @cards[1], @round.current_card
  end

  def test_for_third_card
    @round.take_turn(15)
    @round.take_turn("denver")

    assert_equal @cards[2], @round.current_card
  end

  def test_for_forth_card
    @round.take_turn(15)
    @round.take_turn("denver")
    @round.take_turn("albany")

    assert_equal @cards[3], @round.current_card
  end

  def test_take_turn
    
    assert_instance_of Turn, @round.take_turn(10)
  end

  def test_number_correct
    @round.take_turn(10)
    @round.take_turn(15)

    assert_equal 2, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn(10)
    @round.take_turn(13)
    @round.take_turn("denver")
    @round.take_turn("albany")

    assert_equal 2, @round.number_correct_by_category(:Geography)
  end

  def test_percent_correct
    @round.take_turn(10)
    @round.take_turn(13)
    @round.take_turn("denver")
    @round.take_turn("albany")

    assert_equal 75.0, @round.percent_correct
  end

  def test_percent_correct_by_category
  end

end
