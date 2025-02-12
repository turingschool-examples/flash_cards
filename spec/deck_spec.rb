require './lib/card'
require './lib/turn'
require './lib/deck'

RSpec.describe Deck do
    # This test is checking to see if card returns the question, answer and category of card
    # It's also
    it 'get a card' do
        card = Card.new(:question, :answer, :category)
        deck = Deck.new(card)
    
        expect(deck).to be_instance_of(Deck)
      end
    it 'Is there cards in the deck' do
        card = Card.new(:question, :answer, :category)
        deck = Deck.new([Card])
    
        expect(deck.cards).to eq([Card])
    end
    it 'check for count' do
        card_1 = Card.new(:question, :answer, :category)
        card_2 = Card.new(:question, :answer, :category)
        card_3 = Card.new(:question, :answer, :category)
        deck = Deck.new([card_1,card_2,card_3])

        expect(deck.count).to eq(3) 
    end
    it 'check for category' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        deck = Deck.new([card])

        expect(deck.cards_in_category(:Geography)).to eq([card])
    end

end