require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)

    expect(cards).to be_instance_of(CardGenerator)
  end

  it 'converts text to game cards in Card class' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    expect(cards[0]).to be_instance_of(Card)
  end
end
