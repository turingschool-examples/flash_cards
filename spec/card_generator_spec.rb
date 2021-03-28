require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'
require 'rspec'
require 'pry'

describe CardGenerator do
  it 'exists' do
    filename = './files/cards.txt'
    generator = CardGenerator.new(filename)

    expect(generator).to be_a(CardGenerator)
  end
  describe "#collect" do
    it 'can create cards' do
      filename = './files/cards.txt'
      generator = CardGenerator.new(filename)
      generator.collect
      expect(generator.cards).to be_a(Array)
    end

    it 'creates the cards as Card objects' do
      filename = './files/cards.txt'
      generator = CardGenerator.new(filename)
      generator.collect
      expect(generator.cards[0]).to be_a(Card)
    end
  end
end
