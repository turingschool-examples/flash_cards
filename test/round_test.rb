require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end
  #binding.pry
  #binding.pry
<<<<<<< HEAD

=======
>>>>>>> 13a30ca220bff3a8dcae9681e94a4d3de0d010bd

  def test_round_exists

    assert_instance_of Round, @round
  end

  def test_it_has_deck

    assert_equal @deck, @round.deck
  end

  def test_it_has_turns

    assert_equal [], @round.turns
  end

  def test_it_has_current_card

    assert_equal @card_1, @round.current_card
  end

  def test_it_has_class
    @round.take_turn("Juneau")

    assert_instance_of Turn, @round.turns.first
  end

  def test_it_can_determine_correct?
    @round.take_turn("Juneau")

    assert @round.turns.first.correct?
  end

  def test_it_adds_to_turns
    new_turn = @round.take_turn("Juneau")

    assert_equal [new_turn], @round.turns
  end

  def test_it_counts_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Mars")

    assert_equal 2, @round.number_correct
  end

  def test_it_can_change_current_card

    @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_it_can_test_for_wrong_answer
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 2, @round.turns.count
    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_it_can_count_number_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct
  end

  def test_it_can_calculate_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_it_can_calculate_percent
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    assert_equal 50.0, @round.percent_correct
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    assert_equal @card_3, @round.current_card
  end
end
