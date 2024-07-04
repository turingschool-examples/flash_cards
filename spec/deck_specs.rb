require './lib/card'
require './lib/deck'
require 'rspec'


RSpec.describe Deck do

  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards) # the array of cards object

  end

  it 'It has an array of card objects' do
    expect(@deck.cards).to eq([@card_1, @card_2, @card_3])
  end

  it "has the amount of cards counted" do
    expect(@deck.count).to eq(3)
  end

  it "can return all the cards matching a certain category" do
    expect(@deck.cards_in_category(:Geography).count).to eq(1)
  end

  it "is returning the card object itself" do
    expect(@deck.cards_in_category(:Geography)[0]).to eq(@card_1)
  end

end
  


