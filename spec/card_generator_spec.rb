
require './lib/card'
require './lib/deck'
require './lib/card_generator'

RSpec.describe CardGenerator do
  context 'creates card generator' do
    it 'exists' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards).to be_instance_of(CardGenerator)
    end

    it 'can read a file and convert into cards' do
      filename = "./lib/cards.txt"
      cards = CardGenerator.new(filename).cards

      expect(cards).to eq(filename)
    end
  end
end
