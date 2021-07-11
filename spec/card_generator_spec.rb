require_relative 'spec_helper'

RSpec.describe CardGenerator do
  it 'exists' do
    card_generator = CardGenerator.new('cards.txt')
    expect(card_generator).to be_instance_of(CardGenerator)
  end

  it 'generates an array of cards' do
    card_generator = CardGenerator.new('cards.txt')

    cards = card_generator.generate_cards

    expect(cards).to be_a(Array)
    expect(cards.first.question).to eq("What is 5 + 5?")
    expect(cards.first.answer).to eq("10")
    expect(cards.first.category).to eq("STEM")
  end
end
