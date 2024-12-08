# frozen_string_literal: true

require_relative '../lib/card'
require 'rspec'

describe Card do
  let(:card) { described_class.new('What is the capital of Alaska?', 'Juneau', :Geography) }

  describe '#initialize' do
    subject(:card) { described_class.new('What is the capital of Alaska?', 'Juneau', :Geography) }

    it { is_expected.to be_instance_of(described_class) }
  end

  describe '#question' do
    subject(:question) { card.question }

    it { is_expected.not_to be_nil }

    it 'returns the question' do
      expect(question).to eq('What is the capital of Alaska?')
    end
  end

  describe '#answer' do
    subject(:answer) { card.answer }

    it { is_expected.not_to be_nil }

    it 'returns the answer' do
      expect(answer).to eq('juneau')
    end
  end

  describe '#category' do
    subject(:category) { card.category }

    it { is_expected.not_to be_nil }

    it 'returns the category' do
      expect(category).to eq(:Geography)
    end
  end

  describe '#alternate_answer' do
    subject(:alternate_answer) { card.alternate_answer }

    context 'when alternate answer is not given' do
      it { is_expected.to be_nil }
    end

    context 'when alternate answer is given' do
      let(:card) { described_class.new('What is 5 + 5?', '10', :Geography, 'Ten') }

      it { is_expected.not_to be_nil }

      it 'returns the alternate answer' do
        expect(alternate_answer).to eq('ten')
      end
    end
  end
end
