require 'rspec'
require './lib/card_generator'
require './lib/card'

describe CardGenerator do
  describe '#initialize' do
    it 'is an instance of Card_generator' do
      filename = "cards.txt"
      reader = CardGenerator.new(filename)

      expect(reader).to be_instance_of(CardGenerator)
    end
  end

  describe '#build_cards' do
    it 'builds an array of cards based on input from a text file. requires test_cards.txt' do
      filename = "test_cards.txt"
      reader = CardGenerator.new(filename)

      expect(reader.cards[0].question).to eq("What is 5 + 5?")
      expect(reader.cards[0].answer).to eq("10")
      expect(reader.cards[0].category).to eq(:STEM)
      expect(reader.cards[1].question).to eq("What is Rachel's favorite animal?")
      expect(reader.cards[1].answer).to eq("red panda")
      expect(reader.cards[1].category).to eq(:TuringStaff)
    end
  end
end