# frozen_string_literal: true

require_relative '../lib/card_generator'
require_relative '../lib/deck'
require 'rspec'

describe CardGenerator do
  let(:cards) { described_class.new('cards.txt').cards }

  describe '#initialize' do
    subject(:card_generator) { described_class.new('cards.txt') }

    it { is_expected.to be_instance_of(described_class) }
  end

  describe '#cards' do
    subject(:cards) { described_class.new('cards.txt').cards }

    it { is_expected.not_to be_nil }

    it 'returns array of cards' do
      expect(cards.all?(Card)).to be true
    end
  end

  describe 'parses alternate answers' do
    context 'when alternate answer is not given' do
      it 'does not pass alternate answer' do
        expect(cards[2].alternate_answer).to be_nil
      end
    end

    context 'when alternate answer is given' do
      subject(:alternate_answer) { cards[0].alternate_answer }

      it { is_expected.not_to be_nil }

      it 'passes alternate answer' do
        expect(alternate_answer).to eq 'ten'
      end
    end
  end
end
