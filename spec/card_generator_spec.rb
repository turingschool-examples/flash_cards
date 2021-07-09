require 'rspec'
require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  context 'initialize' do
    it 'exists' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename)


      expect(cards).to be_instance_of(CardGenerator)
    end

    it 'has a way to store the filename' do
      filename = "cards.txt"
      cards = CardGenerator.new(filename)

      expect(cards.filename).to eq("cards.txt")
    end

    it 'has an empty array to store cards' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards.cards).to eq([])
    end
  context 'methods'
    it 'can read other files by using the filename'
      
  end
end
