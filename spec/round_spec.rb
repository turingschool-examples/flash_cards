require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'rspec'
require 'pry'


RSpec.describe Round do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
      and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction
       that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards= [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    expect(round).to be_instance_of(Round)
  end
  describe 'take_turn' do
    it 'records all cards in @turns array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction
         that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards= [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      round.take_turn('Juneau')
      expect(round.turns).to eq(round.deck.cards[0..round.card_counter])
    end
  end

end
