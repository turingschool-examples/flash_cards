
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'card_test'
require_relative '../lib/turn'

class TurnTest
  def test_it_exists
    turn = Turn.new('Washington, D.C', card)

    assert_instance_of Turn, turn
  end

  def test_guess
    turn = Turn.new('Hello', card)

    assert_equal 'Hello', turn.guess
  end

  def test_card
    card = Card.new('What is the meaning of life', '42', :Lifestyle)
    turn = Turn.new('Test', card)

    assert_equal '42', turn.card.answer
  end

  def test_correct
    card = Card.new('test', 'test', :test)
    turn = Turn.new('test', card)

    assert_equal true, turn.correct?
  end

  def test_feedback
    card = Card.new('test', 'test', :test)
    turn = Turn.new('test', card)

    assert_equal 'Correct', turn.feedback
  end

end

