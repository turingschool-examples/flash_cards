require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

describe CardGenerator do
  before :each do
    @filename = "cards.txt"
    @cards = CardGenerator.new(@filename)
  end

  it 'exists' do
    expect(@cards).to be_a CardGenerator
  end

  it 'has a filename' do
    expect(@cards.filename).to eq(@filename)
  end

  it 'initializes with no cards' do
    expect(@cards.cards).to eq []
  end

  it 'can add cards to the array' do
    @cards.add_cards
    expect(@cards.cards.count).to eq 4
  end

end
