require 'rspec'
require './lib/deck'

RSpec.describe 'deck' do
    before(:each) do
        @deck = Deck.new([
                            card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography),
                            card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM),
                            card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
                        ])
    end
    it 'should exist' do
        expect(@deck).to be_instance_of(Deck)
    end

    it 'should hold a number of card objects in an array' do
        expect(@deck.cards).to be_instance_of(Array).and all(be_instance_of(Card))
    end

    it 'has an observable length' do
        expect(@deck.cards.count).to eq 3
    end

    xit 'should return cards based on their category' do
        #code here
    end
end