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

    it 'can read a file' do
      filename = "./lib/cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards.file).to be_a File

    end

  end

  describe '#cards' do
    it 'can create cards from a file' do
      filename = "./lib/cards.txt"
      cards = CardGenerator.new(filename).cards

      expect(cards.first).to be_a Card
      expect(cards.first.answer).to eq "10"
      expect(cards.first.question).to eq "What is 5 + 5?"
      expect(cards.first.category).to eq "STEM"

    end

  end

end
