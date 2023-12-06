require './lib/card_generator'
require './lib/card'
RSpec.describe CardGenerator do
    it 'exists' do
        filename = "cards.txt"
        card_generator = CardGenerator.new(filename)
        expect(card_generator).to be_instance_of(CardGenerator)
    end

    it 'has a cards method' do
        filename = "cards.txt"
        card_generator = CardGenerator.new(filename)
        expect(card_generator.cards.length).to eq(4)


    end



end

