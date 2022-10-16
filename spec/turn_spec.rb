# frozen_string_literal: true
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  describe '#initialize' do
    it 'is a turn' do
      card = Card.new('What is a good state?', 'Alaska', :Geography)
      turn = Turn.new('Alaska', card)

      expect(turn).to be_a Turn
    end

    it 'can take a string and card instance' do
      card = Card.new('What is a good state?', 'Alaska', :Geography)
      turn = Turn.new('Alaska', card)

      expect(turn.guess).to be_a String
      expect(turn.card).to be_a Card
    end
  end

  describe '#correct?' do
    it 'returns true if correct' do
      card = Card.new('What is a good state?', 'Alaska', :Geography)
      turn = Turn.new('Alaska', card)

      expect(turn.correct?).to be true
    end
  end

  describe '#feedback' do
    it 'returns correct! feedback when right answer' do
      card = Card.new('What is a good state?', 'Alaska', :Geography)
      turn = Turn.new('Alaska', card)

      expect(turn.feedback).to eq('Correct!')
    end

    it 'returns incorrect! feedback when wrong answer' do
      card = Card.new('What is a good state?', 'Alaska', :Geography)
      turn = Turn.new('New Jersey', card)

      expect(turn.feedback).to eq('Incorrect.')
    end
  end
end
