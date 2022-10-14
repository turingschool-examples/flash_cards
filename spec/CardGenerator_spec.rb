require './lib/CardGenerator'
file = './lib/cards.txt'

RSpec.describe CardGenerator do
  it 'is part of the CardGenerator class' do
    cards = CardGenerator.new(file)

    expect(cards).to be_a(CardGenerator)
  end

  it 'creates an array of outputs' do
    cards = CardGenerator.new(file)

    expect(cards.cards).to be_a(Array)
  end

  xit 'creates new cards' do
    cards = CardGenerator.new(file)
    cards.make_cards

    expect(cards.cards).to eq([])
  end
end
