require 'RSpec'
require './lib/round'
require './lib/deck'
require './lib/card'
require './lib/turn'
require 'pry'

describe Round do
  it 'creates a new instance' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    round = Round.new(deck)

  expect(round).to be_an_instance_of(Round)
  end
end

describe 'current_card' do
  it 'shows first card in deck array' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)

    expect(round.current_card).to eq(cards[0])
  end
end


describe 'take_turn_1' do
  it 'takes a string representing a guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards  = [card_1, card_2, card_3]
    deck   = Deck.new(cards)
    round  = Round.new(deck)



    expect(round.take_turn("Juneau")).to eq("Juneau")
  end
end


describe 'take_turn_2' do
  xit 'takes a string representing the guess' do
  end
end
