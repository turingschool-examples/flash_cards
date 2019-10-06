require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
# require './lib/card'
# require './lib/deck'
# require './lib/turn'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is your favorite color?!" 'Blue!... No, wait, Red!', "Monty Python", :Movie)
    @card_2 = Card.new("Do or do not...There is no try", "Star Wars", :Movie)
    @card_3 = Card.new("Shot me in the goddamn liver, Morty!", "Rick and Morty", :TV)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  def test_turns
    round = Round.new(@deck)
    assert_equal(round.turns, [])
    round.take_turn("Monty Python")
    assert_equal(1, round.turns.count)
    assert_kind_of(Turn, round.turns[0])
  end

  def test_current_card
    round = Round.new(@deck)
    assert_equal(@card_1, round.current_card)
  end

  def test_take_turn
    round = Round.new(@deck)
    turn = round.take_turn("Monty Python")
    assert_kind_of(Turn, turn)
    assert_equal(1, round.turns.count)
    assert_equal(2, round.deck.count)
  end

  def test_number_correct
    round = Round.new(@deck)
    turn = round.take_turn("Monty Python")
    assert_equal(1, round.number_correct)
  end

  def test_number_incorrect
    round = Round.new(@deck)
    turn = round.take_turn("Monty Pythooo")
    assert_equal(0, round.number_correct)
  end

  def test_number_correct_by_category
    round = Round.new(@deck)
    round.take_turn("Monty Python")
    round.take_turn("Star Wars")
    round.take_turn("Rick and Morty")
    assert_equal(2, round.number_correct_by_category(:Movie))
    assert_equal(1, round.number_correct_by_category(:TV))
  end

  def test_number_incorrect_by_category
    round = Round.new(@deck)
    round.take_turn("Monty Python")
    round.take_turn("Star War")
    round.take_turn("Rick and Mourny")
    assert_equal(1, round.number_correct_by_category(:Movie))
    assert_equal(0, round.number_correct_by_category(:TV))
  end

  def test_percent_correct
    round = Round.new(@deck)
    round.take_turn("Monty Python")
    round.take_turn("Star Wars")
    round.take_turn("Rick and Morty")
    assert_equal(100, round.percent_correct)
  end

  def test_percent_correct_by_category
    round = Round.new(@deck)
    round.take_turn("Monty Pycharm")
    round.take_turn("Star Wars")
    round.take_turn("Rick and Morty")
    assert_equal(50, round.percent_correct_by_category(:Movie))
    assert_equal(100, round.percent_correct_by_category(:TV))
  end
end
