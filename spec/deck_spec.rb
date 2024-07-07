require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
    
    end

    it 'is initialized with an array of cards' do
        expect(@deck).to be_instance_of(Deck)
        expect(@deck.cards).to eq(@cards)
    end

    it 'can return cards in a given category' do
        expect(@deck.cards_in_category (:Geography)).to eq([@card_1])
        expect(@deck.cards_in_category (:STEM)).to eq([@card_2, @card_3])
        expect(@deck.cards_in_category (:PopCulture)).to eq([])
    end

    it 'returns the number of cards' do
        expect(@deck.count).to eq(3)
    end
 
end

    # it 'has a name' do
    #     dragon = Dragon.new('Ramoth', :gold, 'Lessa')
    #     expect(dragon.name).to eq('Ramoth')
    #   end