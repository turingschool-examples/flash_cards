require './lib/card_generator'

RSpec.describe CardGenerator do

    it 'exists' do
        file_path = './lib/cards.txt'
        card_generator = CardGenerator.new(file_path)

        expect(card_generator).to be_instance_of(CardGenerator)
    end

    it 'generates cards from the text file' do
        file_path = './lib/cards.txt'
        card_generator = CardGenerator.new(file_path)

        expect(card_generator.cards).to all(be_instance_of(Card))
        expect(card_generator.cards.first.question).to eq("What is 5 + 5?")
        expect(card_generator.cards.last.answer).to eq("Mitochondria")
    end

end