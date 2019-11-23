require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

class RoundTest < MiniTest::Test

  def test_round_exists
skip
  card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
                     reports about the surface of which planet?", "Mars", :STEM)
  card_3 = Card.new("Describe in words the exact direction that is 697 .5°
                     clockwise from due north?", "North north west", :STEM)

  cards = [card_1, card_2, card_3]

  deck = Deck.new(cards)

  round = Round.new(deck)

  #deck = cards

  assert_instance_of Round, round

  end

  def test_current_card

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and
                       reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697 .5°
                       clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_take_turn

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697 .5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")

    assert_instance_of Turn, new_turn
  end

  def test_number_correct

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697 .5° clockwise from due north?", "North north west", :STEM)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)

    new_turn = round.take_turn("Juneau")
binding.pry
    assert_equal 1, round.number_correct

  end

end
