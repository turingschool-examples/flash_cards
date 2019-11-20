require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    alaska = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, alaska
  end

  def test_turn_it_exists
    alaska = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", alaska)

    assert_instance_of Turn, turn1
  end

  def test_card_method_works
    alaska = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", alaska)

    assert_equal alaska, turn1.card
  end

  def test_guess_method_works
    alaska = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", alaska)

    assert_equal "Juneau", turn1.guess
  end

  def test_correct_method_works
    alaska = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", alaska)

    truefalse = (
      if alaska.answer == turn1.guess
        then true
      else false
      end)


    assert_equal truefalse, turn1.correct?
  end

  def test_feedback_method_works
    alaska = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", alaska)

    comment = (
      if alaska.answer == turn1.guess
        then "You are smart."
      else "You are dumb."
      end)

      assert_equal comment, turn1.feedback
  end
end
