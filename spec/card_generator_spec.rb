require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

describe CardGenerator do
  before :each do
    @filename = "cards.txt"
    @card_generator = CardGenerator.new(@filename)
  end

  it 'exists' do
    expect(@card_generator).to be_a CardGenerator
  end

  it 'has a filename' do
    expect(@card_generator.filename).to eq(@filename)
  end

  it 'initializes with no cards' do
    expect(@card_generator.cards).to eq []
  end

  it 'can add cards to the array' do
    @card_generator.add_cards
    expect(@card_generator.cards.count).to eq 4
  end

  it 'can create a deck' do
    @card_generator.add_cards
    deck = Deck.new(@card_generator.cards)
    expect(deck).to be_a Deck
  end
end
