require './lib/card_generator'
require 'rspec'

describe CardGenerator do
  describe '#initialize' do
    it 'exists' do
      filename = "./lib/cards.txt"
      cards = CardGenerator.new(filename)

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

    it 'can read a file' do
      filename = "./lib/cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards.file).to be_a File
      
    end

  end

end
