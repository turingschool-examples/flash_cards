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
      formatted_array = cards.txt_to_cards
      # formatted_deck = unformated_cards_array.format_cards
      p cards
      # require "pry"; binding.pry
      expect(formatted_array).to eq([["What is 5 + 5?", "10", "STEM"], ["What is Rachel's favorite animal?", "red panda", "TuringStaff"], ["What is Mike's middle name?", "nobody knows", "TuringStaff"], ["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"]])
    end
  end

end
