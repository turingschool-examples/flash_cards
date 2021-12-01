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
    it 'adds Turn class information to turns array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction
         that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards= [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      round.take_turn('hi')
      expect(round.turns).not_to be_empty
      expect(round.turns.last).to be_instance_of(Turn)
    end
    it 'can add more than one Turn to array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
        and reports about the surface of which planet?", "Mars", :STEM)

      card_3 = Card.new("Describe in words the exact direction
         that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards= [card_1, card_2, card_3]
      deck = Deck.new(cards)
      round = Round.new(deck)
      round.take_turn('hi')
      round.take_turn('France')
      expect(round.turns.length).to eq(2)
    end
  end
end 
