# frozen_string_literal: true

require_relative '../lib/card_generator'
require_relative '../lib/card'
require 'rspec'

RSpec.describe CardGenerator do
  it 'exists' do
    cards = CardGenerator.new('cards.txt')

    expect(cards).to be_instance_of(CardGenerator)
  end

  it 'holds cards' do
    cards = CardGenerator.new('cards.txt')

    card1 = Card.new('What is 5 + 5?', '10', 'STEM')
    card2 = Card.new("What is Rachel's favorite animal?", 'red panda', 'Turing Staff')
    card3 = Card.new("What is Mike's middle name?", 'nobody knows', 'Turing Staff')
    card4 = Card.new('What cardboard cutout lives at Turing?', 'Justin bieber', 'PopCulture')
    actual = [card1, card2, card3, card4]

    expect(cards.cards).to eq(actual)
  end
end
