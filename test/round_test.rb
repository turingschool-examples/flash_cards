require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'

def create_cards
  card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
  card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?","North North West",:STEM)
  [card1,card2,card3]
end

def create_round
  cards = create_cards
  deck = Deck.new(cards)
  round = Round.new(deck)
end

class RoundTest < Minitest::Test
  def test_it_exists
    round = create_round
    assert_instance_of Round, round
  end

  def test_it_has_cards
    round = create_round
    deck = round.deck
    cards = create_cards
    assert_equal cards, deck.cards
  end


end
