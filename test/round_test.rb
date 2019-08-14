require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class TurnTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
    card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)

    card_deck = [card_1, card_2, card_3, card_4, card_5]
    start_deck = Deck.new(card_deck)
    round = Round.new(start_deck)

    assert_instance_of Round, round
  end

  def test_round_has_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    card_4 = Card.new("Who was the clinical doctor who developed the hormonal birth control pill?", "John Rock", :HISTORY)
    card_5 = Card.new("What area of psychology incorporates the body?", "Somatic Psychology", :HEALTH)

    card_deck = [card_1, card_2, card_3, card_4, card_5]
    start_deck = Deck.new(card_deck)
    round = Round.new(start_deck)

    assert_equal round.deck, start_deck
    assert_equal 5, round.card_in_deck
  end

end
