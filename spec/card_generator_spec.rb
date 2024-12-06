# frozen_string_literal: true

require_relative '../lib/card_generator'
require_relative '../lib/deck'
require 'rspec'

describe CardGenerator do
  let(:cards) { CardGenerator.new('cards.txt').cards }
  let(:deck) { Deck.new(cards) }

  describe 'Initialization' do
    let(:cards) { CardGenerator.new('cards.txt') }

    it 'is an instance of CardGenerator' do
      expect(cards).to be_instance_of(CardGenerator)
    end
  end

  describe 'Hold and count cards' do
    it 'can hold cards' do
      expect(deck).to be_instance_of(Deck)
    end

    it 'can count cards' do
      expect(deck.count).to eq(4)
    end
  end

  describe 'Find cards by category' do
    it 'can find cards by category-1' do
      expect(deck.cards_in_category('STEM')).to eq([cards[0]])
    end

    it 'can find cards by category-2' do
      expect(deck.cards_in_category('Geography')).to eq([])
    end

    it 'can find cards by category-3' do
      expect(deck.cards_in_category('Turing Staff')).to eq([cards[1], cards[2]])
    end
  end
end
