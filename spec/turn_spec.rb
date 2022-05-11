require 'rspec'
require './lib/turn.rb'


describe Turn do
  describe 'argument' do
    it 'is initialized with two arguments' do
      turn = Turn.new("Junea", "Placeholder for current card")
      expect(turn.guess).to eq("Junea")
      expect(turn.card).to eq("Placeholder for current card")
    end
  end
end

describe 'guess' do
  it 'returns the guess' do
  turn = Turn.new("Junea", "Placeholder for current card")
  expect(turn.guess). to eq("Junea")
  end
end

describe 'correct?' do
  it 'checks if the guess matches the answer' do
    turn = Turn.new("Junea", "Placeholder")
    expect(turn.correct?).to eq(true)
  end
end
