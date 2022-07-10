require './lib/card_generator'

describe CardGenerator do
    it 'exists' do
        card_generator = CardGenerator.new("cards.txt")
        expect(card_generator).to be_an_instance_of(CardGenerator)
    end

    it 'is an array of cards' do
        cards = CardGenerator.new("cards.txt").cards

        expect(cards.class).to eq(Array)
        expect(cards[0]).to be_an_instance_of(Card)
    end

    it 'contains 5 cards' do
        cards = CardGenerator.new("cards.txt").cards

        expect(cards.length).to eq(5)
    end

    it 'converts categories to a symbol' do
        cards = CardGenerator.new("cards.txt").cards
        card = cards[2]
        expect(card.category).to be_an_instance_of(Symbol)
    end
end
