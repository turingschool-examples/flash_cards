require 'rspec'
require 'card'
require 'card_generator'

RSpec.describe CardGenerator do
  it 'has an instance of Card Generator' do
  filename = 'cards.txt'
  cards = CardGenerator.new(filename)
  expect(cards).to be_an_instance_of(CardGenerator)
  end

  it 'holds no cards in library by default' do
    filename = 'cards.txt'
    cards = CardGenerator.new(filename)
    expect(cards.card_library).to eql(nil)
    end

    it 'generates a set of 7 cards inside card library' do
      filename = 'cards.txt'
      cards = CardGenerator.new(filename)
      cards.cards
      expect(cards.card_library.count).to eql(7)
      end
end
