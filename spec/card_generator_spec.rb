require './lib/card_generator'
require './lib/card'
RSpec.describe CardGenerator do
    it 'exists' do
        filename = "card.txt"
        expect(cards = CardGenerator.new(filename)).to be_instance_of(CardGenerator)
    end
    it 'creates cards' do
        filename = "card.txt"
        expect(cards = CardGenerator.new(filename).cards).to include(an_instance_of(Card))
    end
end