require './lib/CardGenerator'
file = './lib/cards.txt'

RSpec.describe CardGenerator do
  it 'is part of the CardGenerator class' do
    new_cards = CardGenerator.new(file)

    expect(new_cards).to be_a(CardGenerator)
  end

  it 'creates an array of outputs' do
    new_cards = CardGenerator.new(file)

    expect(new_cards.cards).to be_a(Array)
  end

  it 'creates new cards' do
    new_cards = CardGenerator.new(file)
    new_cards.make_cards

    expect(new_cards.cards[0]).to be_a(Card) 
  end
end
