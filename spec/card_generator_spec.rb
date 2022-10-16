require './lib/card_generator'
require 'rspec'

describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      cards = CardGenerator.new('stuff')

      expect(cards).to be_a CardGenerator
    end

    it 'can pass a text file' do
      filename = "./lib/cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards.filename).to eq "./lib/cards.txt"
    end

    it 'starts with an empty cards array' do
      filename = "./lib/cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards.cards).to eq []

    end

  end

end
