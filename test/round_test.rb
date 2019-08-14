require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class RoundTest < Minitest::Test

  CARD_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  CARD_2 = Card.new("The Viking spacecrafte sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  CARD_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west,", :STEM)
  CARDS = [CARD_1, CARD_2, CARD_3]
  DECK = Deck.new(CARDS)

  def test_it_exists
    round = Round.new(DECK)

    assert_instance_of Round, round
  end

  def test_it_has_deck
    round = Round.new(DECK)

    assert_equal DECK, round.deck  
  end

  def test_current_card
    round = Round.new(DECK)

    assert_equal CARD_1, round.current_card
  end

  def test_turn_created
    round = Round.new(DECK)
    round.take_turn("Juneau")

    assert_instance_of Turn, round.turns.first
  end

  def test_card_removed
    
  end
end
