require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

describe CardGenerator do
  it 'exists and takes a file as an argument' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards).to be_a CardGenerator
  end

  describe '#txt_to_cards' do
    it 'formats the array of cards to separate question, answer and category' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename)
      formatted_array = cards.cards

      # require "pry"; binding.pry
      expect(formatted_array[0].question).to eq("What is 5 + 5?")
      expect(formatted_array[0].answer).to eq("10")
      expect(formatted_array[0].category).to eq("STEM")

      expect(formatted_array[1].question).to eq("What is Rachel's favorite animal?")
      expect(formatted_array[1].answer).to eq("red panda")
      expect(formatted_array[1].category).to eq("Turing Staff")
    end
  end

end
