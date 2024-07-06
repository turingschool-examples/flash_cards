require 'rspec'
require './lib/deck'

RSpec.configure do |config|
    config.formatter = :documentation
    end


RSpec.describe 'deck' do
    before(:each) do
       
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card_1, @card_2, @card_3])
    end
    it 'should exist' do
        expect(@deck).to be_instance_of(Deck)
    end

    it 'should hold a number of card objects in an array' do
        expect(@deck.cards).to be_instance_of(Array)
    end

    it 'has an observable length' do
        expect(@deck.cards.count).to eq 3
    end

    it 'should return cards based on their category' do
        expect(@deck.cards_in_category(:STEM)).to eq [@card_2, @card_3]
    end
end