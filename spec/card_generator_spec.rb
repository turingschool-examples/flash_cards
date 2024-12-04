# frozen_string_literal: true

require_relative '../lib/card_generator'
require 'rspec'

RSpec.describe CardGenerator do
  it 'exists' do
    cards = CardGenerator.new('cards.txt')

    expect(cards).to be_instance_of(CardGenerator)
  end

  it 'holds cards' do
    cards = CardGenerator.new('cards.txt')

    expect(cards.cards[0]).to be_instance_of(Card)
  end
end
