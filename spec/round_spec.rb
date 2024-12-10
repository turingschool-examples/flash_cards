# frozen_string_literal: true

require_relative '../lib/round'
require_relative '../lib/deck'
require_relative '../lib/card'
require 'rspec'

describe Round do
  let(:cards) do
    [
      Card.new(:Geography, 'What is the capital of Alaska?', ['Juneau']),
      Card.new(:STEM, 'Who is the CEO of SpaceX?', ['Elon Musk']),
      Card.new(:STEM, 'Describe in words the exact direction of 697.5° clockwise from due north?', ['North north west'])
    ]
  end
  let(:deck) { Deck.new(cards) }
  let(:round) { described_class.new(deck) }

  describe '#initialize' do
    subject(:round) { described_class.new(deck) }

    it { is_expected.to be_instance_of(described_class) }
  end

  describe '#deck' do
    subject(:deck) { Deck.new(cards) }

    it { is_expected.not_to be_nil }

    it 'returns the deck' do
      expect(round.deck).to eq(deck)
    end
  end

  describe '#turns' do
    subject(:turns) { round.turns }

    it { is_expected.not_to be_nil }

    context 'when no turns have been taken' do
      it 'returns empty array' do
        expect(turns).to eq([])
      end
    end

    context 'when turns have been taken' do
      it 'returns array of turns' do
        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(turns.all?(Turn)).to be true
      end
    end

    describe '.size' do
      subject(:size) { round.turns.size }

      it { is_expected.not_to be_nil }

      it 'returns amount of turns' do
        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(size).to eq(2)
      end
    end
  end

  describe '#current_card' do
    subject(:current_card) { round.current_card }

    it { is_expected.not_to be_nil }

    context 'when no turns have been taken' do
      it 'returns first card' do
        expect(current_card).to eq(deck.cards[0])
      end
    end

    context 'when one turn has been taken' do
      it 'returns second card' do
        round.take_turn('Juneau')
        expect(current_card).to eq(deck.cards[1])
      end
    end

    context 'when two turns have been taken' do
      it 'returns third card' do
        round.take_turn('Juneau')
        round.take_turn('Venus')

        expect(current_card).to eq(deck.cards[2])
      end
    end
  end

  describe '#number_correct' do
    subject(:number_correct) { round.number_correct }

    it { is_expected.not_to be_nil }

    it 'returns amount of correct answers' do
      round.take_turn('Juneau')
      round.take_turn('Venus')

      expect(number_correct).to eq(1)
    end
  end

  describe '#number_correct_by_category' do
    subject(:number_correct_by_category) { round.number_correct_by_category(:Geography) }

    it { is_expected.not_to be_nil }

    it 'returns number correct by category' do
      round.take_turn('Juneau')
      round.take_turn('Venus')

      expect(number_correct_by_category).to eq(1)
    end
  end

  describe '#percent_correct' do
    subject(:percent_correct) { round.percent_correct }

    it { is_expected.not_to be_nil }

    it 'returns percent correct' do
      round.take_turn('Juneau')
      round.take_turn('Venus')

      expect(percent_correct).to eq(50.0)
    end
  end

  describe '#percent_correct_by_category' do
    subject(:percent_correct_by_category) { round.percent_correct_by_category(:Geography) }

    it { is_expected.not_to be_nil }

    it 'returns percent correct by category' do
      round.take_turn('Juneau')
      round.take_turn('Venus')

      expect(percent_correct_by_category).to eq(100.0)
    end
  end
end
