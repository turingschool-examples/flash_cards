require 'rspec'
require './lib/deck'
require './lib/card'

RSpec.describe Deck do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("What is the square root of 81?", "9", :Math)
    @card_3 = Card.new("Who wrote 'To Kill a Mockingbird'?", "Harper Lee", :Literature)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end

  it 'exists' do
    expect(@deck).to be_instance_of(Deck)
  end

  it 'has cards' do
    expect(@deck.cards).to eq(@cards)
  end

  it 'can count cards' do
    expect(@deck.count).to eq(3)
  end
  
  it 'can return cards in a given category' do
    expect(@deck.cards_in_category(:Geography)).to eq([@card_1])
    expect(@deck.cards_in_category(:Math)).to eq([@card_2])
    expect(@deck.cards_in_category(:Literature)).to eq([@card_3])
    expect(@deck.cards_in_category(:Science)).to eq([])
  end
end
