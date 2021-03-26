require './lib/card_generator'
require 'rspec'

filename = "cards.txt"

RSpec.describe CardGenerator do

  context 'class set up' do

    it 'exists' do
      cards = CardGenerator.new(filename)

      expect(cards).to be_instance_of(CardGenerator)
    end

  end

  context 'class attributes' do

    it 'hold cards in txt file' do

      cards = CardGenerator.new(filename)
      cards_array = File.open('cards.txt', 'r') do |file|
                    arr = file.readlines
                    end

      # cards.split_into_categories
      expect(cards.split_each).to eq(cards_array)
    end
  end


end
