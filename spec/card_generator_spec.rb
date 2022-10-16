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

  describe '#create_cards' do
    it 'can create cards from a file' do
      filename = "./lib/cards.txt"
      card_gen = CardGenerator.new(filename)

      card_gen.create_cards

      expect(card_gen.cards.first).to be_a Card
      expect(card_gen.cards.first.answer).to eq "10"
      expect(card_gen.cards.first.question).to eq "What is 5 + 5?"
      expect(card_gen.cards.first.category).to eq "STEM"

    end

  end

end
