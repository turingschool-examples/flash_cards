require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class RoundTest < Minitest::Test

  def test_round_creation_instantiates_all_the_things
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_instance_of Deck, deck
    assert_equal [card_1, card_2, card_3], deck.cards
    assert_instance_of Round, round
    assert_equal deck, round.deck
  end

  def test_round_turns_collection_starts_empty
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_empty round.turns
  end

  def test_round_current_card_returns_first_index_of_deck_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_round_take_turn_is_turn_object_that_accepts_turn_methods
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    assert_instance_of Turn, new_turn
    assert new_turn.correct?
  end

  def test_round_deck_rotates_after_new_turn_is_correct_and_stores_turns
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    assert_equal card_2, round.current_card
    assert_equal card_1, round.deck.cards.last
    assert_includes round.turns, new_turn
  end

  def test_round_correct_answer_count_increments
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    new_turn = round.take_turn("Juneau")
    assert_equal 1, round.number_correct
  end

  def test_round_taking_second_turn_adds_second_turn_to_turns_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")
    assert_equal 2, round.turns.count
  end

  def test_round_second_guess_is_incorrect
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")
    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_round_number_correct_does_not_increase_with_incorrect_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")
    assert_equal 1, round.number_correct
  end

  def test_round_number_correct_by_category_calculates
    # skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")
    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 0, round.number_correct_by_category(:STEM)
  end

  def test_round_percent_correct_calculates
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")
    assert_equal 50.0, round.percent_correct
  end

  def test_round_percent_correct_by_category_calculates
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")
    assert_equal 100.0, round.percent_correct_by_category(:Geography)
  end

  def test_round_current_card_shifts_to_card_3_after_second_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")
    assert_equal card_3, round.current_card
  end

  def test_round_group_turns_by_category_produces_hash_with_categories_as_keys
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Venus")
    assert_instance_of Hash, round.group_turns_by_category
    assert_equal [:Geography, :STEM], round.group_turns_by_category.keys
  end

  def test_round_can_initiate_with_deck_created_by_card_gen_object
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    round = Round.new(cards)
    assert_instance_of Deck, round.deck
    assert_equal 10, round.deck.cards.length
    assert_equal "What is the capital of Alaska?", round.deck.cards.first.question
  end
end
