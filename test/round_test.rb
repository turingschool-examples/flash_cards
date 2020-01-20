require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/round.rb'


class RoundTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_keeps_track_of_turns
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal [], round.turns
  end

  def test_it_can_identify_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal card_1, round.current_card
    end

end
