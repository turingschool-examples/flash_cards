require 'rspec'
require './lib/card'
require './lib/card_generator'



RSpec.describe CardGenerator do
  it 'exists' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    expect(cards).to be_instance_of(CardGenerator)
  end

  it 'generates cards' do
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    card_1 = Card.new("What is 5 + 5?", "10", "STEM")
      expect(cards).to be_instance_of(Array)
      expect(cards[0]).to be_instance_of(Card)
      expect(cards[0].question).to eq(card_1.question)
  end
end
