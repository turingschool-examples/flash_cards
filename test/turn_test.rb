require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require "pry"

class TurnTest < Minitest::Test

  def test_if_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Saturn", card)

    assert_instance_of Turn, turn
 end

  def test_if_has_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end


  def test_if_card_is_returned
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal "Juneau", turn.guess
  end

  def test_correct_is_true
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal true, turn.correct?
  end

  def test_correct_is_false
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Saturn", card)

    assert_equal false, turn.correct?
  end

  def test_feedback_when_correct
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    assert_equal 'Correct!', turn.feedback
  end

  def test_feedback_when_incorrect
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Bluneau', card)

    assert_equal 'Incorrect.', turn.feedback
  end

end
