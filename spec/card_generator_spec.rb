require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe CardGenerator do
  it 'exists' do
    filename = 'cards.txt'
    cards = CardGenerator.new(filename)

    expect(cards).to be_instance_of(CardGenerator)
  end

  it 'creates a card' do
    filename = 'cards.txt'
    cards = CardGenerator.new(filename).cards

    card_1 = Card.new('What is 5 + 5?', '10', 'STEM')

    expect(cards[0].question).to eq(card_1.question)
    expect(cards[0].answer).to eq(card_1.answer)
    expect(cards[0].category).to eq(card_1.category)
    expect(cards[0]).to be_instance_of(Card)
  end

  it 'creates an array of cards' do
    filename = 'cards.txt'
    cards = CardGenerator.new(filename).cards

    expect(cards).to be_instance_of(Array)
  end
end
