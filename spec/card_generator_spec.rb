# frozen_string_literal: true

require_relative '../lib/card_generator'
require_relative '../lib/deck'
require 'rspec'

describe CardGenerator do
  let(:deck) { Deck.new(cards) }

  describe '#initialize' do
    subject(:cards) { described_class.new('cards.txt') }

    it { is_expected.to be_instance_of(described_class) }
  end

  describe '#cards' do
    subject(:cards) { described_class.new('cards.txt').cards }

    it { is_expected.not_to be_nil }

    it 'returns array of cards' do
      expect(cards.all?(Card)).to be true
    end
  end
end
