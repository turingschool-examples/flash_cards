require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Italy?", "Rome", :Geography)
    @card_2 = Card.new("What is the capital of England?", "London", :Geography)
    @card_3 = Card.new("What is Japan's form of currency?", "Yen", :Finance)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_does_round_exist
    assert_instance_of Round, @round
  end

  def test_does_deck_exist_in_round
    assert_equal @deck, @round.deck
  end

  def test_turns
    assert_equal [], @round.turns

    @round.take_turn("Rome")

    assert_equal "Rome", @round.turns.first.guess
  end

    def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn
    new_turn = Turn.new("Rome", @card_1)

    assert_equal new_turn.guess, @round.take_turn("Rome").guess
  end

  def test_if_new_turn_is_class
    new_turn = Turn.new("Rome", @card_1)

    assert_equal Turn, new_turn.class
  end

  def test_if_turn_correct
      new_turn = Turn.new("Rome", @card_1)

    assert_equal true, new_turn.correct?
  end

  def test_if_turn_incorrect
    new_turn_2 = Turn.new("Denver", @card_1)

    refute new_turn_2.correct?
  end

  def test_number_correct
    @round.take_turn("Rome")

    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Rome")
    @round.number_correct_by_category(:Geography)

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Rome")
    @round.take_turn("Denver")
    @round.number_correct_by_category(:Geography)
    @round.number_correct_by_category(:STEM)
    @round.percent_correct

    assert_equal 50.0, @round.percent_correct
  end

  def test_percent_correct_by_category
    @round.take_turn("Rome")
    @round.take_turn("Denver")
    @round.take_turn("Yen")

    assert_equal 50.0, @round.percent_correct_by_category(:Geography)
    assert_equal 100.0, @round.percent_correct_by_category(:Finance)
  end
end
