require './lib/turn'
require './lib/card'
require './lib/deck'
require 'rspec'
require 'pry'


RSpec.describe Card do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
      and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction
       that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards= [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck).to be_instance_of(Deck)
  end

  it "can print out cards in Deck" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
      and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction
       that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards= [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq([card_1, card_2, card_3])
  end
  it "recognizes length" do

    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
      and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction
       that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards= [card_1, card_2, card_3]
    deck = Deck.new(cards)

    expect(deck.count).to eq(3)

  end

  it 'Can sort by category' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
      and reports about the surface of which planet?", "Mars", :STEM)

    card_3 = Card.new("Describe in words the exact direction
       that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards= [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck.cards_in_category(:STEM)).to eq(deck.cards[1..2])
    # expect(deck.cards_in_category(:Geography)).to eq(deck.cards[0]) #Why! 
  end

end
