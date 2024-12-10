# frozen_string_literal: true

require_relative '../lib/card'
require 'rspec'

describe Card do
  let(:card) { described_class.new(:Geography, 'What is the capital of Alaska?', ['Juneau']) }

  describe '#initialize' do
    subject(:card) { described_class.new(:Geography, 'What is the capital of Alaska?', ['Juneau']) }

    it { is_expected.to be_instance_of(described_class) }
  end

  describe '#category' do
    subject(:category) { card.category }

    it { is_expected.not_to be_nil }

    it 'returns the category' do
      expect(category).to eq(:Geography)
    end
  end

  describe '#question' do
    subject(:question) { card.question }

    it { is_expected.not_to be_nil }

    it 'returns the question' do
      expect(question).to eq('What is the capital of Alaska?')
    end
  end

  describe '#answers' do
    subject(:answers) { card.answers }

    it { is_expected.not_to be_nil }

    context 'when no answers given' do
      let(:card) { described_class.new(:Geography, 'What is the capital of Alaska?') }

      it 'returns empty array' do
        expect(answers).to eq([])
      end
    end

    context 'when one answer given' do
      it 'returns array of one answer' do
        expect(answers).to eq(['juneau'])
      end
    end

    context 'when multiple answers given' do
      let(:card) { described_class.new(:Geography, 'What is the capital of Alaska?', ['Juneau', 'Alternate Answer']) }

      it 'returns array of answers' do
        expect(answers).to eq(['juneau', 'alternate answer'])
      end
    end
  end
end
