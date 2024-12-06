# frozen_string_literal: true

require_relative '../lib/card'
require_relative '../lib/turn'
require 'rspec'

describe Turn do
  let(:card) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }
  let(:turn) { Turn.new('Juneau', card) }

  describe 'Initialization' do
    it 'is an instance of Turn' do
      expect(turn).to be_instance_of(Turn)
    end
  end

  describe 'Store and retrieve data' do
    it 'has a guess' do
      expect(turn.guess).to eq('Juneau')
    end

    it 'has a card' do
      expect(turn.card).to eq(card)
    end
  end

  describe 'Compare guess to result' do
    describe 'Return boolean; true if correct' do
      it 'can confirm correct guess' do
        expect(turn.correct?).to be true
      end

      it 'can disregard case-1' do
        turn = Turn.new('juneau', card)

        expect(turn.correct?).to be true
      end

      it 'can disregard case-2' do
        turn = Turn.new('JUNEAU', card)

        expect(turn.correct?).to be true
      end

      it 'can reject incorrect guess' do
        turn = Turn.new('Anchorage', card)

        expect(turn.correct?).to be false
      end
    end

    describe 'Provide feedback' do
      it 'can provide feedback for correct guess' do
        expect(turn.feedback).to eq('Correct!')
      end

      it 'can provide feedback for incorrect guess' do
        turn = Turn.new('Anchorage', card)

        expect(turn.feedback).to eq('Incorrect.')
      end
    end
  end
end
