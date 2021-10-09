require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

RSpec.describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      file = File.open('./lib/cards.txt')
      card_generator = CardGenerator.new(file)

      expect(card_generator).to be_an_instance_of(CardGenerator)
    end
  end

  describe '#create_cards' do
    it 'creates cards from given txt file' do
      file = File.open('./lib/cards.txt')
      card_generator = CardGenerator.new(file)

      expect(card_generator.cards.count).to eq(5)
      expect(card_generator.cards).to be_an(Array)
    end
  end
end
