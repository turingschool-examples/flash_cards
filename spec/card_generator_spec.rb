require './lib/card'
require './lib/card_generator'
require 'csv'

RSpec.describe CardGenerator do
  describe '#initialize' do
    card_generator = CardGenerator.new("cards.txt")

    it 'is a CardGenerator' do
      expect(card_generator).to be_a CardGenerator
    end

    it 'has a filename' do
      expect(card_generator.filename).to eq 'cards.txt'
    end
  end

  describe '#cards' do
    it 'creates an array' do
      card_generator = CardGenerator.new("cards.txt")

      expect(card_generator.cards).to be_a Array
    end

    it 'creates an array of Card class objects' do
      card_generator = CardGenerator.new("cards.txt")

      expect(card_generator.cards.first).to be_a Card
    end

    it 'creates the expected cards' do
      card_generator = CardGenerator.new("cards.txt")

      expect(card_generator.cards.first.question).to eq "What is 5 + 5?"
      expect(card_generator.cards.first.answer).to eq "10"
      expect(card_generator.cards.first.category).to eq "STEM"
    end
  end
end
