require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card1 = Card.new("Who won the NHL Stanley Cup this most previous year?", "St. Louis Blues", :Sports)
    card2 = Card.new("What is the longest river in the world?", "Nile", :Geography)
    card3 = Card.new("Who has won the Masters the most times?", "Jack Nicklaus", :Sports)

    assert_instance_of Card, card
    assert_instance_of Card, card1
    assert_instance_of Card, card2
    assert_instance_of Card, card3
  end

  def test_it_has_a_question
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card1 = Card.new("Who won the NHL Stanley Cup this most previous year?", "St. Louis Blues", :Sports)
    card2 = Card.new("What is the longest river in the world?", "Nile", :Geography)
    card3 = Card.new("Who has won the Masters the most times?", "Jack Nicklaus", :Sports)

    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Who won the NHL Stanley Cup this most previous year?", card1.question
    assert_equal "What is the longest river in the world?", card2.question
    assert_equal "Who has won the Masters the most times?", card3.question
  end

  def test_it_has_an_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card1 = Card.new("Who won the NHL Stanley Cup this most previous year?", "St. Louis Blues", :Sports)
    card2 = Card.new("What is the longest river in the world?", "Nile", :Geography)
    card3 = Card.new("Who has won the Masters the most times?", "Jack Nicklaus", :Sports)

    assert_equal "Juneau", card.answer
    assert_equal "St. Louis Blues", card1.answer
    assert_equal "Nile", card2.answer
    assert_equal "Jack Nicklaus", card3.answer
  end

  def test_it_has_a_category
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card1 = Card.new("Who won the NHL Stanley Cup this most previous year?", "St. Louis Blues", :Sports)
    card2 = Card.new("What is the longest river in the world?", "Nile", :Geography)
    card3 = Card.new("Who has won the Masters the most times?", "Jack Nicklaus", :Sports)

    assert_equal :Geography, card.category
    assert_equal :Sports, card1.category
    assert_equal :Geography, card2.category
    assert_equal :Sports, card3.category
  end
end
