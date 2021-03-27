require './lib/card_generator'
require 'rspec'


RSpec.describe CardGenerator do

  filename = "cards.txt"
  
  context 'class set up' do

    it 'exists' do
      cards = CardGenerator.new(filename)

      expect(cards).to be_instance_of(CardGenerator)
    end

  end

  context 'class attributes' do

    it 'know what filename is' do

      cards = CardGenerator.new(filename)
      cards_array = File.open(filename, 'r') do |file|
                    file.readlines.map(&:chomp)
                    end

      expect(cards.filename).to eq('cards.txt')
    end

  end

  context 'generates cards from file' do

    it 'transfers cards in txt file to generator' do

      cards = CardGenerator.new(filename)
      cards_array = File.open(filename, 'r') do |file|
                    file.readlines.map(&:chomp)
                    end

      expect(cards.generate_cards).to eq(cards_array)
    end

    it 'splits elements of card array' do
      cards = CardGenerator.new(filename)
      cards_array = File.open(filename, 'r') do |file|
                    file.readlines.map(&:chomp)
                    end
      expect(cards.split_generated_cards[0]).to eq(["What is 5 + 5?", "10", "STEM"])
      expect(cards.split_generated_cards[1]).to eq(["What is Rachel's favorite animal?", "red panda", "Turing Staff"])
      expect(cards.split_generated_cards[2]).to eq(["What is Mike's middle name?", "nobody knows", "Turing Staff"])
      expect(cards.split_generated_cards[3]).to eq(["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"])
    end

    it 'recognizes card attributes' do

      cards = CardGenerator.new(filename)
      cards_array = File.open(filename, 'r') do |file|
                    file.readlines.map(&:chomp)
                    end
      cards.generate_cards
      cards.split_generated_cards

      expect(cards.cards[0].question).to eq("What is 5 + 5?")
      expect(cards.cards[3].question).to eq("What cardboard cutout lives at Turing?")
      expect(cards.cards[1].answer).to eq("red panda")
      expect(cards.cards[2].answer).to eq("nobody knows")
      expect(cards.cards[3].category).to eq("PopCulture")
      expect(cards.cards[0].category).to eq("STEM")
    end

  end

end
