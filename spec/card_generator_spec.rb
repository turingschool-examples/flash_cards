# frozen_string_literal: true

require_relative '../lib/card_generator'
require_relative '../lib/deck'
require 'rspec'

describe CardGenerator do
  describe 'Initialization' do
    it 'is an instance of CardGenerator' do
      cards = CardGenerator.new('cards.txt')

      expect(cards).to be_instance_of(CardGenerator)
    end
  end

  describe 'Hold and count cards' do
    it 'can hold cards' do
      cards = CardGenerator.new('cards.txt').cards
      deck = Deck.new(cards)

      expect(deck).to be_instance_of(Deck)
    end

    it 'can count cards' do
      cards = CardGenerator.new('cards.txt').cards
      deck = Deck.new(cards)

      expect(deck.count).to eq(4)
    end
  end

  describe 'Find cards by category' do
    it 'can find cards by category-1' do
      cards = CardGenerator.new('cards.txt').cards
      deck = Deck.new(cards)

      expect(deck.cards_in_category('STEM')).to eq([cards[0]])
    end

    it 'can find cards by category-2' do
      cards = CardGenerator.new('cards.txt').cards
      deck = Deck.new(cards)

      expect(deck.cards_in_category('Geography')).to eq([])
    end

    it 'can find cards by category-3' do
      cards = CardGenerator.new('cards.txt').cards
      deck = Deck.new(cards)

      expect(deck.cards_in_category('Turing Staff')).to eq([cards[1], cards[2]])
    end
  end
end
