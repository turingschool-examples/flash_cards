require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([card_1, card_2, card_3])
    @round = Round.new(deck)
    @new_turn = round.take_turn("Juneau")
  end

  def test_it_exists
    assert_instance_of round.deck
  end

  def test_turn_exist
    assert_equal round.turns
  end

  def test_can_call_current_card
    assert_equal round.current_card
  end

  def test_class_exists
    assert_equal new_turn.class
  end

  def test_answer_is_correct
    assert_equal new_turn.correct?
  end

  def test_next_turns_happen
    assert_equal round.turns
  end

  def tst_number_is_correct
    assert_equal round.number_correct
  end

  def test_we_second_card
    assert_equal round.current_card
  end

  def test_third_turn_answer_venus
    assert_equal round.take_turn("Venus")
  end

  def test_for_multiple_turns
    assert_equal round.turns.count
  end

  def test_last_turn_happens
    assert_equal round.turns.last.feedback
  end

  def test_number_of_cards_is_correct
    assert_equal round.number_correct
  end

  def test_number_of_cards_correct_by_category_geography
    assert_equal round.number_correct_by_category(:Geography)
  end

  def test_number_of_cards_correct_by_category_STEM
    assert_equal round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    assert_equal round.percent_correct
  end

  def test_percent_correct_by_category_geography
    assert_equal round.percent_correct_by_category(:Geography)
  end
end
