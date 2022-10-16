require 'rspec'
require './lib/card'
require './lib/card_generator'

RSpec.describe CardGenerator do
  filename = "cards.txt"
  card_gen = CardGenerator.new(filename)
  cards = card_gen.cards

  it 'exists' do
    expect(card_gen).to be_a CardGenerator
  end

  it 'takes a filename' do
    expect(card_gen.filename).to eq filename
  end

  it 'contains an array of Card objects' do
    cards.each do |card|
      expect(card).to be_a Card
    end
  end

  describe 'interactions with cards.txt' do
    it 'reads the question' do
      expect(cards[0].question).to eq "What is the capital of Alaska?"
    end

    it 'reads the answer' do
      expect(cards[0].answer).to eq "Juneau"
    end

    it 'reads the category' do
      expect(cards[0].category).to eq :Geography
    end

    it 'reads every question' do
      expect(cards.length).to be 9
    end
  end
end
