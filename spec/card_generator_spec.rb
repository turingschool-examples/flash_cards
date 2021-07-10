require_relative 'spec_helper'

RSpec.describe CardGenerator do
  it 'exists' do
    cards = CardGenerator.new('cards.txt')
    expect(cards).to be_instance_of(CardGenerator)
  end

  it 'generates an array of cards' do
    cards = CardGenerator.new("cards.txt")
    cards.generate_cards
    expect(cards).to be_kind_of(Array)

  end
end
