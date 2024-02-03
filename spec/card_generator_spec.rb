require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do
  it 'exists' do
    card_generator = CardGenerator.new('./cards.txt')

    expect(card_generator).to be_instance_of(CardGenerator)
  end

  it 'can convert cards info from a text file to Cards' do
    card_generator = CardGenerator.new('./cards.txt')

    expect(card_generator.cards).to be_empty
    card_generator.convert_to_cards

    expect(card_generator.cards[0]).to be_instance_of(Card)
  end
end
