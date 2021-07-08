require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = './lib/cards.txt'
    generated = CardGenerator.new(filename)

    expect(generated).to be_a(CardGenerator)
  end

  it 'can create cards' do
    filename = './lib/cards.txt'
    cards = CardGenerator.new(filename).cards
    
    expect(cards[0]).to be_a(Card)
    expect(cards.all? { |card| card.class == Card }).to eq(true)
  end
end