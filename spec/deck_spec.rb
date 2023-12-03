require './lib/card.rb'
require './lib/deck.rb'

RSpec.describe Deck do
    before(:each) do
        #setup for tests below
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card_1, @card_2, @card_3])
    end

    it 'exists' do
        expect(@deck).to be_an_instance_of (Deck)    
    end

    it "stores cards" do
        expect(@deck.cards).to eq ([@card_1,@card_2,@card_3])
    end

    it "can return cards based from its category" do
        expect(@deck.cards_in_category(:STEM)).to eq ([@card_2, @card_3])
    end

    it "can return an empty array when no cards have been created in the category" do
        expect(@deck.cards_in_category("Pop Culture")).to eq ([])
    end

    it "can return an array of the cards classes" do
        expect(@deck.categories_in_deck).to eq ([:Geography, :STEM])

    end

end