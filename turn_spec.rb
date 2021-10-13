require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
  describe '#initialize' do
    it 'receives the guess and card' do
      card = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      turn = Turn.new('Denver', card)
      expect(turn).to be_a Turn
    end
  end

  describe '#guess' do
    it 'should return Denver' do
      card = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      turn = Turn.new('Denver', card)
      expect(turn.guess).to eq('Denver')
    end
  end

  describe '#card' do
    it 'should return the entire card' do
      card = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      turn = turn.new('Denver', card)
      expect(turn.card).to eq(card)
    end
  end

  describe '#correct?' do
    it 'should return true' do
      card = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      turn = turn.new('Denver', card)
      expect(turn.correct?).to be true
    end
  end

  describe '#feedback' do
    it 'should print Correct!' do
      card = Card.new('What is the capital of Colorado?', 'Denver', :Geography)
      turn = turn.new('Denver', card)
      expect(turn.feedback).to eq('Correct!')
    end
  end
end
