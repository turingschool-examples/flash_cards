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
      cards = CardGenerator.new("./lib/cards.txt")

      expect(cards.filename).to be_a File
    end

  end

end
