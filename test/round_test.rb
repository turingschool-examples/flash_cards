require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
#require './flashcard_runner'

class RoundTest< MiniTest::Test

  def setup
    card = [@question, @answer, @category]
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)

  end

  def test_does_it_exist
    round = Round.new(@deck)
    assert_instance_of Round, round
    assert round.turns
  end

  def test_does_it_take_turn
      round = Round.new(@deck)
      assert_instance_of Turn, round.take_turn("Juneau")
  end

  def test_what_is_the_current_card
    round = Round.new(@deck)
    assert_equal @card_1, round.current_card
  end

  def test_take_turn_with_correct_guess
    round = Round.new(@deck)
    player_turn1 = round.take_turn("Juneau")
    assert player_turn1.correct?
  end

  def test_take_turn_with_incorrect_guess
    round = Round.new(@deck)
    player_turn2 = round.take_turn("Anchorage")
    refute player_turn2.correct?
  end

  def test_number_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("North north west")
    assert_equal 3, round.number_correct
  end

  def test_number_correct_if_guess_wrong
    round = Round.new(@deck)
    round.take_turn("Anchorage")
    round.take_turn("Mars")
    round.take_turn("North north west")
    refute_equal 3, round.number_correct
  end

  def test_number_cat_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("North north west")

    assert_equal 1, round.number_cat_correct(:Geography)
    assert_equal 2, round.number_cat_correct(:STEM)
  end

  def test_number_cat_correct_if_guess_wrong
    round = Round.new(@deck)
    round.take_turn("Anchorage")
    round.take_turn("Mars")
    round.take_turn("North west")

    refute_equal 1, round.number_cat_correct(:Geography)
    refute_equal 2, round.number_cat_correct(:STEM)
  end

  def test_percent_correct
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("North north west")

    assert_equal 100, round.percent_correct
  end

  def test_percent_correct_if_guess_wrong
    round = Round.new(@deck)
    round.take_turn("Anchorage")
    round.take_turn("Mars")
    round.take_turn("North west")

    refute_equal 100, round.percent_correct
    assert_equal 33.3, round.percent_correct
  end

  def test_percent_correct_by_category
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Mars")
    round.take_turn("North west")

    assert_equal 1, round.number_cat_correct(:Geography)
    refute_equal 2, round.number_cat_correct(:STEM)
  end
end
