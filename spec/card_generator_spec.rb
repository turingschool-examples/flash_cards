require './lib/card_generator.rb'
require './lib/card.rb'

RSpec.describe do
    it 'exists' do
        card_generator = CardGenerator.new("cards.txt")

        expect(card_generator).to be_instance_of(CardGenerator)
    end

    it 'creates cards' do
        filename = "cards.txt"
        cards = CardGenerator.new(filename).cards

        expect(cards).to include(Card)
    end
end
