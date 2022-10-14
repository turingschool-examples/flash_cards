require './lib/card_generator'

filename = "cards.txt"

RSpec.describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      cards = CardGenerator.new(filename)

      expect(cards).to be_instance_of(CardGenerator)
    end

    it 'can pull the text file' do
      cards = CardGenerator.new(filename)

      expect(cards.filename).to eq filename
    end
  end
end