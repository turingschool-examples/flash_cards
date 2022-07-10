require './lib/card_generator'

describe Card_Generator do
  it 'exists' do
    card_generator = Card_Generator.new('cards.txt')
    expect(card_generator).to be_instance_of(Card_Generator)
  end

  it 'reads files' do
    card_generator = Card_Generator.new('cards.txt')
    cards = card_generator.cards
    expect(cards).to all(be_instance_of(Card))

  end
end
