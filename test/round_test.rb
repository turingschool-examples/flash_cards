require "minitest/autorun"
require "minitest/pride"
require "./lib/card"
require "./lib/deck"
require "./lib/turn"
require "./lib/round"

class RoundTest < Minitest::Test

  def test_round_exists
    round = Round.new(create_deck)

    assert_instance_of Round, round
  end

  def test_round_contains_deck
    round = Round.new(create_deck)

    assert_instance_of Deck, round.deck
  end

  def test_round_starts_with_no_turns
    round = Round.new(create_deck)

    assert_equal [], round.turns
  end

  def test_current_card_is_first_card
    round = Round.new(create_deck)

    assert_instance_of Card, round.current_card
  end

  def test_can_take_turns
    round = Round.new(create_deck)

    assert_instance_of Turn, round.take_turn("guess to question")
  end

  def test_turn_is_correct_if_correct
    round = Round.new(create_deck)
    new_turn = round.take_turn("Juneau")

    assert_equal true, new_turn.correct?
  end

  def test_played_turn_is_added_to_turns_array
    round = Round.new(create_deck)
    new_turn = round.take_turn("Juneau")

    assert_equal [new_turn], round.turns

    another_turn = round.take_turn("Mars")

    assert_equal 2, round.turns.count
  end

  def test_counts_correct_answers
    round = Round.new(create_deck)
    new_turn = round.take_turn("Juneau")

    assert_equal 1, round.number_correct
  end

  def test_current_card_changes_after_turn
    round = Round.new(create_deck)
    second_turn_card = round.deck.cards[1]
    first_turn = round.take_turn("Juneau")

    assert_equal second_turn_card, round.current_card
  end

  def test_incorrect_guesses_are_incorrect
    round = Round.new(create_deck)
    second_turn_card = round.deck.cards[1]
    first_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Norway")

    assert_equal "Incorrect.", round.turns.last.feedback
  end

  def test_incorrect_guesses_are_not_counted_as_correct
    round = Round.new(create_deck)
    new_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Norway")

    assert_equal 1, round.number_correct

  end

  def test_knows_number_correct_by_category
    round = Round.new(create_deck)
    new_turn = round.take_turn("Juneau")
    second_turn = round.take_turn("Norway")

        
    assert_equal 1, round.number_correct_by_category(:Geography)
  end



  def create_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft was sent to which planet?", "Mars", :STEM)
    card_3 = Card.new("What is the airspeed velocity of an unladen swallow?", "African or European?", :STEM)
    cards = [card_1, card_2, card_3]
  end

  def create_deck
    deck = Deck.new(create_cards)
  end

end
