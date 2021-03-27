require './lib/card'
require './lib/cardgenerator'

RSpec.describe CardGenerator do
  describe '#initialize' do
    generator = CardGenerator.new('cards.txt')

    it 'can create array' do
      expect(generator.cards).to be_instance_of(Array)
    end

    it 'has array that contains ten elements' do
      expect(generator.cards.count).to eq(10)
    end

    it 'array elements are card objects' do
      expect(generator.cards[0].answer).to eq('169')
    end

  end
end
