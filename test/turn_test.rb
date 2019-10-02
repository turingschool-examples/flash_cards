require 'minitest/autorun'
require 'minitest/pride'
#require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_it_has_a_question
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "What is the capital of Alaska?", turn.card.question
  end

  def test_it_has_an_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.card.answer
  end

  def test_it_has_a_category
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal :Geography, turn.card.category
  end

end
