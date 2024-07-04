require './lib/card'
require './lib/deck'

Rspec. describe Deck do
    before do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        @cards = [card_1, card_2, card_3]
        @deck = Deck.new(@cards)
    end

    xit 'exists' do
        expect(@deck).to be_instance_of(Deck)
    end

    xit 'has cards' do
        expect(@deck.cards).to eq(@cards)
    end

    xit 'can count the number of cards in the deck' do
        expect(@decks.count).to eq 3
    end

    xit 'can call all cards from specific categories' do
        expect(@deck.cards_in_category(:STEM)).to eq [@card_2, @card_3]
        expect(@deck.cards_in_category(:Geography)).to eq [@card_1]
    end

    xit 'should return an empty array if category does not exist' do
        expect(@deck.cards_in_category('Pop Culture')).to eq []
    end



