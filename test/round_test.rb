require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def test_round_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_deck_in_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_turns_in_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal [card_1], [round.current_card]
  end

  def test_turn_class
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal Turn, round.take_turn("Juneau").class
  end

  def test_turn_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert round.take_turn("Juneau").correct?
    refute round.take_turn("Juneau").correct?

  end

  def test_turns
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal [round.take_turn("Juneau")], round.turns
  end

  def test_number_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?","Mars",:STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North north west",:STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    assert_equal 1, round.number_correct
  end

end
