require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
def test_it_exists
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  assert_instance_of Round, round
end

def test_deck_method_exists
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  assert_equal deck, round.deck
end

def test_turns_method_exists_and_current_card
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)

  assert_equal [], round.turns
  turn_1 = round.take_turn("Juneau")
  assert_equal [turn_1], round.turns
  assert_equal card_2, round.current_card
  turn_2 = round.take_turn("Venus")
  assert_equal [turn_1, turn_2], round.turns
  assert_equal card_3, round.current_card
end

def test_new_turns_are_instances_of_class_Turn
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  turn_1 = round.take_turn("Juneau")
  turn_2 = round.take_turn("Mars")

  assert_instance_of Turn, turn_1
  assert_instance_of Turn, turn_2
end

def test_if_guess_is_correct
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  turn_1 = round.take_turn("Juneau")
  turn_2 = round.take_turn("Mars")

  assert_equal true, turn_1.correct?
  assert_equal true, turn_2.correct?
end

def test_which_cards_have_already_taken_a_turn
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  turn_1 = round.take_turn("Juneau")
  turn_2 = round.take_turn("Mars")

  assert_equal [turn_1, turn_2], round.turns
end

def test_number_of_correct_cards
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  turn_1 = round.take_turn("Juneau")
  turn_2 = round.take_turn("Venus")

  assert_equal 1, round.number_correct
  assert_equal "Incorrect.", round.turns.last.feedback
end

def test_number_of_correct_cards_by_category
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  turn_1 = round.take_turn("Juneau")
  turn_2 = round.take_turn("Venus")

  assert_equal 1, round.number_correct_by_category(:Geography)
  assert_equal 0, round.number_correct_by_category(:STEM)
end

def test_percent_correct_turns
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  turn_1 = round.take_turn("Juneau")
  turn_2 = round.take_turn("Venus")

  assert_equal 50.0, round.percent_correct
end

def test_percent_correct_by_category
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  deck = Deck.new([card_1, card_2, card_3])
  round = Round.new(deck)
  turn_1 = round.take_turn("Juneau")
  turn_2 = round.take_turn("Venus")

  assert_equal 100.0, round.percent_correct_by_category(:Geography)
  assert_equal 0.0, round.percent_correct_by_category(:STEM)
end
end
