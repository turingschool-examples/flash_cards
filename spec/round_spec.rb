require 'RSpec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

describe Round do
  describe '#initialize' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck.add_cards(card_1)
    deck.add_cards(card_2)
    deck.add_cards(card_3)
    cards =[card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    it 'is a round' do
     expect(round).to be_instance_of(Round)
    end
  end
end
