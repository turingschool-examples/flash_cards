require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def setup
    @cards = [
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography),
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    ]
  end

  def test_there_is_a_deck_of_cards_in_a_round

    deck = Deck.new(@cards)
    round = Round.new(deck)

    assert_instance_of Deck, deck
    assert_instance_of Deck, round.deck
  end

  def test_no_turns_have_been_taken_when_a_round_starts
    deck = Deck.new(@cards)
    round = Round.new(deck)

    assert_equal 0, round.turns.count
  end

  def test_when_round_starts_top_card_is_drawn
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography),
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    assert_equal round.current_card, card_1

  end

  def test_round_has_turns
    deck = Deck.new(@cards)
    round = Round.new(deck)

    require "Pry"; binding.pry
  end
end
