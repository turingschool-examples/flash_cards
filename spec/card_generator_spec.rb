require './lib/card_generator'

RSpec.describe CardGenerator do
    it 'exists' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards).to be_a(CardGenerator)
    end
end
