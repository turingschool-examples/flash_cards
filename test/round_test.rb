require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def test_round_exists
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_deck_method_works
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert_equal round.deck, deck
  end

  def test_turns_method_returns_empty_array
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert_equal [], round.turns
  end

  def test_current_card_method
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    assert_equal card1, round.current_card
  end

  def test_take_turn_in_round
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    assert_equal new_turn, round.turns
  end

  def test_round_number_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    assert_equal 1, round.number_correct
  end

  def test_round_moves_forward
    skip
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    assert_equal card2, round.current_card
    round.take_turn("Venus")
    assert_equal 2, round.turns.count
    assert_equal card3, round.current_card
  end

  def test_last_feedback
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    assert_equal "Correct!", round.turns.last.feedback
    assert_equal 1, round.number_correct
    round.take_turn("Venus")
   assert_equal "Incorrect!", round.turns.last.feedback
    assert_equal 1, round.number_correct
    round.take_turn("North north west")
    assert_equal "Correct!", round.turns.last.feedback
    assert_equal 2, round.number_correct
  end

  def test_number_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn("Juneau")
    assert_equal 1, round.number_correct
    round.take_turn("Venus")
    assert_equal 1, round.number_correct
    round.take_turn("North north west")
    assert_equal 2, round.number_correct
  end

  end

#  pry(main)> round.number_correct_by_category(:Geography)
  #=> 1

#  pry(main)> round.number_correct_by_category(:STEM)
  #=> 0

#  pry(main)> round.percent_correct
  #=> 50.0

#  pry(main)> round.percent_correct_by_category(:Geography)
  #=> 100.0

#  pry(main)> round.current_card
  #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
