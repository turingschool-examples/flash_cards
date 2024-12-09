require "./lib/card"
require "./lib/deck"

RSpec.describe Deck do 
    it 'exists' do
        deck = Deck.new

        expect(deck).to be_an_instance_of(Deck)
    end

    it 'has cards' do
        deck = Deck.new

        expect(deck.add_cards).to eq([])
    end

    xit 'counts cards in the deck' do
        deck = Deck.new
        
        expect(deck.count).to eq(3)
    end

    xit 'has a category' cards.each do |card|
        
end
