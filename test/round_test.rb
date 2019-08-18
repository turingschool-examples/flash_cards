require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_card_1
    assert_instance_of Card, @card_1
  end

  def test_card_2
    assert_instance_of Card, @card_2
  end

  def test_card_3
    assert_instance_of Card, @card_3
  end

  def test_deck_var
    assert_instance_of Deck, @deck
  end

  def test_round
    assert_instance_of Round, @round
  end

  def test_deck
    assert_equal @deck, @round.deck
  end

  def test_turns
    assert @round.turns == []
  end

  def test_current_card_1
    assert_equal @card_1, @round.current_card
  end

  def test_take_turn_1
    new_turn = @round.take_turn("Juneau")

    assert @round.turns.count == 1
    assert_equal @card_2, @round.current_card
  end

  def test_turn_class
    new_turn = @round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_turn_correct
    new_turn = @round.take_turn("Juneau")

    assert new_turn.correct? == true
  end

  def test_turns_2
    new_turn = @round.take_turn("Juneau")

    assert @round.turns[0] == new_turn
  end

  def test_number_correct_1
    new_turn = @round.take_turn("Juneau")

    assert @round.number_correct == 1
  end

  def test_current_card_2
    new_turn = @round.take_turn("Juneau")

    assert_equal @card_2, @round.current_card
  end

  def test_take_turn_2
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert @round.turns.count == 2
    assert_equal @card_3, @round.current_card
  end

  def test_turn_count
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert @round.turns.count == 2
  end

  def test_turn_last_feedback
    new_turn_1 = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert @round.turns.last.feedback == "Incorrect."
  end

  def test_number_correct_2
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert @round.number_correct == 1
  end

  def test_number_correct_by_category_1
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert @round.number_correct_by_category(:Geography) == @round.correct_by_category.count
  end

  def test_number_correct_by_category_2
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert @round.number_correct_by_category(:STEM) == 0
  end

  def test_percent_correct
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert @round.percent_correct == 50.0
  end

  def test_percent_correct_by_cateogry
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert @round.percent_correct_by_category(:Geography) == 100.0
  end

  def test_current_card_3
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")

    assert_equal @card_3, @round.current_card
  end

end
