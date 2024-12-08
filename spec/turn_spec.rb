# frozen_string_literal: true

require_relative '../lib/card'
require_relative '../lib/turn'
require 'rspec'

describe Turn do
  let(:card) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography, 'alt') }
  let(:turn) { described_class.new('Juneau', card) }

  describe '#initialize' do
    subject(:turn) { described_class.new('Juneau', card) }

    it { is_expected.to be_instance_of(described_class) }
  end

  describe '#guess' do
    subject(:guess) { turn.guess }

    it { is_expected.not_to be_nil }

    it 'returns the guess' do
      expect(guess).to eq('Juneau')
    end
  end

  describe '#card' do
    subject(:turn_card) { turn.card }

    it { is_expected.not_to be_nil }

    it 'returns the card' do
      expect(turn_card).to eq(card)
    end
  end

  describe '#correct?' do
    subject(:correct?) { turn.correct? }

    it { is_expected.not_to be_nil }

    context 'when guess is exact' do
      it { is_expected.to be true }
    end

    context 'when guess is correct with wrong case' do
      let(:turn) { described_class.new('JuNeAu', card) }

      it { is_expected.to be true }
    end

    context 'when guess is alternate answer' do
      let(:turn) { described_class.new('alt', card) }

      it { is_expected.to be true }
    end

    context 'when guess is incorrect' do
      let(:turn) { described_class.new('incorrect', card) }

      it { is_expected.to be false }
    end
  end

  describe '#feedback' do
    subject(:feedback) { turn.feedback }

    it { is_expected.not_to be_nil }

    context 'when guess is correct' do
      it 'returns string "Correct!"' do
        expect(feedback).to eq('Correct!')
      end
    end

    context 'when guess is incorrect' do
      let(:turn) { described_class.new('wrong', card) }

      it 'returns string "Incorrect."' do
        expect(feedback).to eq('Incorrect.')
      end
    end
  end
end
