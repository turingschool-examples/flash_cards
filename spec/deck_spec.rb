require './lib/turn'
require './lib/card'
require './lib/deck'
require 'rspec'
require 'pry'


RSpec.describe Card do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs
      and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction
       that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards= [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
  end
  it 'exists' do
    expect(@deck).to be_instance_of(Deck)
  end

  it "can print out cards in Deck" do
    expect(@deck.cards).to eq([@card_1, @card_2, @card_3])
  end
  it "recognizes length" do
    expect(@deck.count).to eq(3)
  end
  it 'Can sort by category' do
    expect(@deck.cards_in_category(:STEM)).to eq(@deck.cards[1..2])
  end
end
