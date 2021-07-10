require 'rspec'
require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  context 'initialize' do
    it 'exists' do
      filename = "cards.txt"
      generated_cards = CardGenerator.new(filename)


      expect(generated_cards).to be_instance_of(CardGenerator)
    end

    it 'has a way to store the filename' do
      filename = "lib/cards.txt"
      generated_cards = CardGenerator.new(filename)

      expect(generated_cards.filename).to eq("lib/cards.txt")
    end

    it 'has an empty array to store cards' do
    filename = "./resources/cards.txt"
    generated_cards = CardGenerator.new(filename)

    expect(generated_cards.cards).to eq([])
    end
  end

  context 'methods' do

    context 'read_file' do
      it 'can read other files by using the filename' do
        filename = "./resources/cards.txt"
        generated_cards = CardGenerator.new(filename)

        expect(generated_cards.read_file).to eq(["What is 5 + 5?,10,STEM",
          "What is Rachel's favorite animal?,red panda,Turing Staff",
          "What is Mike's middle name?,nobody knows,Turing Staff",
          "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"])
      end
    end

    context 'input_formatter' do
      it 'can take file data and convert it into an array of each string/element' do
        filename = "./resources/cards.txt"
        generated_cards = CardGenerator.new(filename)

        expect(generated_cards.input_formatter[0]).to eq(["What is 5 + 5?", "10", "STEM"])
        expect(generated_cards.input_formatter[1]).to eq(["What is Rachel's favorite animal?", "red panda", "Turing Staff"])
        expect(generated_cards.input_formatter[2]).to eq(["What is Mike's middle name?", "nobody knows", "Turing Staff"])
        expect(generated_cards.input_formatter[3]).to eq(["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"])
      end
    end
    context 'make_cards' do
      it 'uses input_formatter to convert each array into a card object' do
        filename = "./resources/cards.txt"
        generated_cards = CardGenerator.new(filename)

        expect(generated_cards.make_cards[0]).to be_a(Card)
        expect(generated_cards.make_cards[1]).to be_a(Card)
        expect(generated_cards.make_cards[2]).to be_a(Card)
      end
    end
  end
end
