require 'spec_helper'

RSpec.describe CardGenerator do
  it 'exists' do
    card_gen = CardGenerator.new('cards.txt')

    expect(card_gen).to be_a CardGenerator
  end

  it 'can create cards' do
    card_gen = CardGenerator.new('cards.txt')

    cards = card_gen.cards

    expect(cards[0]).to be_a Card
    expect(cards[0].question).to eq('What is the capital of Alaska?')
  end
end
