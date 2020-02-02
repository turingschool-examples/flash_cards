require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def test_it_can_exist
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_turns_starts_empty
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_current_card_returns_top_card
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    assert_equal card1, round.current_card
  end

  def test_take_turn_creates_a_new_turn
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_correct_returns_true_for_correct_guess
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_turns_returns_array_of_turns
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    new_turn1 = round.take_turn("Juneau")
    assert_equal [new_turn1], round.turns

    new_turn2 = round.take_turn("Venus")
    assert_equal [new_turn1, new_turn2], round.turns
  end

  def test_number_correct_returns_number_of_correct_guesses
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    # Correct guess
    new_turn1 = round.take_turn("Juneau")
    assert_equal 1, round.number_correct

    # Incorrect guess
    new_turn2 = round.take_turn("Venus")
    assert_equal 1, round.number_correct

    # Correct guess
    new_turn3 = round.take_turn("North north west")
    assert_equal 2, round.number_correct
  end

  def test_second_card_becomes_first_after_first_turn
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    assert_equal card2, round.current_card
  end

  def test_number_correct_counts_number_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card1, card2, card3])
    round = Round.new(deck)

    # Inorrect guess
    round.take_turn("Anchorage")
    assert_equal 0, round.number_correct

    # Correct guess
    round.take_turn("Mars")
    assert_equal 1, round.number_correct
  end

  def test_counts_number_correct_by_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])

    round = Round.new(deck)

    # Correct guess :Geography
    round.take_turn("Juneau")
    # Correct guess :STEM
    round.take_turn("Mars")
    # Incorrect guess :STEM
    round.take_turn("South")

    assert_equal 1, round.number_correct_by_category(:Geography)
    assert_equal 1, round.number_correct_by_category(:STEM)
  end

  def test_calculate_percent_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])

    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")
    round.take_turn("North north west")

    assert_equal 67, round.percent_correct
  end

  def test_calculate_percent_correct_by_category
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card4 = Card.new("Who is the best puppy?", "Ripley", :STEM)
    deck = Deck.new([card1, card2, card3, card4])

    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")
    round.take_turn("South")
    round.take_turn("Ripley")

    assert_equal 33, round.percent_correct_by_category(:STEM)
  end

  def test_third_card_is_first_after_second_turn
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card1, card2, card3])

    round = Round.new(deck)
    round.take_turn("Juneau")
    round.take_turn("Venus")

    assert_equal card3, round.current_card
  end
end
