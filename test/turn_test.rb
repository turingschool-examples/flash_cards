require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/turn.rb'


class CardTest < Minitest::Test

  def setup
    #@correct = [true, false].sample #random boolean
    @correct = false
  end

  def test_it_exists
    card, turn = create_card_and_turn(@correct)
      assert_instance_of Turn, turn
  end

  def test_it_has_guess
    card, turn = create_card_and_turn(@correct)
      assert_equal @correct ? "Juneau" : "Not Jeaneau", turn.guess
  end

  def test_it_has_a_card
    card, turn = create_card_and_turn(@correct)
    assert_equal  card, turn.card
  end

  def test_correct
    card, turn = create_card_and_turn(@correct)
    assert_equal @correct, turn.correct?
  end

  def test_feedback
    card, turn = create_card_and_turn(@correct)
    assert_equal @correct ? "Correct!" : "Incorrect.", turn.feedback
  end

  def test_double_equal
    card, turn = create_card_and_turn(@correct)
    card2, turn2 = create_card_and_turn(@correct)
    assert_equal turn, turn2
  end

  private

  def create_card_and_turn(correct)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new(correct ? "Juneau" : "Not Jeaneau",card)
    return card, turn
  end
end
