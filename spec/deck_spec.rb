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
end

#deck = Deck.new(cards) will test for the existence of the Deck class
