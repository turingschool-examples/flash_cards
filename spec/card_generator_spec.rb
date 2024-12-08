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

  describe 'parses answers' do
    context 'when no answer is given' do
      subject(:answers) { cards[0].answers }

      it { is_expected.not_to be_nil }

      it 'returns empty array' do
        expect(cards[6].answers).to eq []
      end
    end

    context 'when one answer is given' do
      subject(:answers) { cards[2].answers }

      it { is_expected.not_to be_nil }

      it 'returns array with answer' do
        expect(answers).to eq ['red panda']
      end
    end

    context 'when multiple answers are given' do
      subject(:answers) { cards[3].answers }

      it { is_expected.not_to be_nil }

      it 'returns array of answers' do
        expect(answers).to eq ['nobody knows', 'no one knows', 'unknown', 'n/a']
      end
    end
  end
end
