require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
# require './lib/card'

class TurnTest < Minitest::Test

  # Test the instance with a correct guess
  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  # test it has a guess
  def test_guess_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  # test it has a card
  def test_card_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal card, turn.card
  end

  # test a correct guess against the card's answer
  def test_guess_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", card.answer
  end

  # test an incorrect guess against a card's answer
  def test_guess_is_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    refute_equal turn.guess, card.answer 
  end
end
