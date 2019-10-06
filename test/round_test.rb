require 'minitest/pride'
require 'minitest/autorun'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("What has a positive charge in an atom?", "Proton", :STEM)
    @card_3 = Card.new("What is the square root of 144?", 12, :STEM)

    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)

  end

  def test_round_exists
    assert_instance_of Round, @round
  end

  def test_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn
    player_turn = @round.take_turn("Juneau")
    assert_instance_of Turn, player_turn
    assert_equal player_turn.guess, player_turn.card.answer
  end

  def test_take_turn_wrong_guess
    player_turn = @round.take_turn("Anchorage")
    assert_equal false, player_turn.guess == player_turn.card.answer
  end

  def test_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Proton")
    @round.take_turn(12)
    assert_equal 3, @round.number_correct
  end

  def test_number_correct_in_STEM_cat
    @round.take_turn("Juneau")
    @round.take_turn("Proton")
    @round.take_turn(12)
    assert_equal 2, @round.number_correct_by_category(:STEM)
  end

  def test_number_correct_in_geo_cat
    @round.take_turn("Juneau")
    @round.take_turn("Proton")
    @round.take_turn(12)
    assert_equal 1, @round.number_correct_by_category(:Geography)
  end

  def test_number_correct_in_non_cat
    @round.take_turn("Juneau")
    @round.take_turn("Proton")
    @round.take_turn(12)
    assert_equal 0, @round.number_correct_by_category(:Trivia)
  end

  def test_percent_correct
    @round.take_turn("Juno")
    @round.take_turn("Proton")
    @round.take_turn(12)
    assert_equal 66.7, @round.percent_correct
  end

  def test_percent_correct_in_STEM_category
    skip
    @round.take_turn("Juneau")
    @round.take_turn("Proton")
    @round.take_turn(14)
    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
  end
end
