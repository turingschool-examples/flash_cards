require 'minitest/autorun'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < MiniTest::Test

  # Constants

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
    "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
    "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end


  # Corrects

  def test_instantiation_round_object
    round = Round.new(@deck)

    assert_instance_of Round, round
  end

  def test_instance_variables_of_round
    round = Round.new(@deck)

    assert_equal [@card_1, @card_2, @card_2], round.deck
    assert_equal [], round.turns
  end

  def test_round_current_card_method
    round = Round.new(@deck)

    assert_equal @card_1, round.current_card
  end

  def test_round_new_turn
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
    assert new_turn.correct?
    assert_equal 1, round.turns.count
    assert_equal @card_2, round.current_card
  end

  def test_take_turn_will_change_deck_order_and_turn
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 2, round.turns.size
    assert_equal "Incorrect.", round.turns.last.feedback
    assert_equal 1, round.number_correct
  end

  def test_filter_round_by_category
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_statistics
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal 50.0, round.percent_correct
    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end

  def test_current_card_is_dynamic
    round = Round.new(@deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal @card_3, round.current_card
  end


  # Incorrects

  def test_incorrect_current_card
    round = Round.new(@deck)

    refute_equal @card_2, round.current_card
  end

  def test_turn_returns_incorrect
    round = Round.new(@deck)
    new_turn = round.take_turn("Juneaoo")

    refute new_turn.correct?
    assert_equal "Incorrect", new_turn.feedback
  end

end
