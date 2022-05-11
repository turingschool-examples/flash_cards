require 'rspec'
require './lib/turn.rb'
require './lib/card'


describe Turn do
  describe 'argument' do
    it 'accepts the first argument' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junea", card)
      expect(turn.guess).to eq("Junea")
    end

  describe 'second argument' do
    it 'accepts the second argument' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junea", card)
      expect(turn.card).to eq(card)
    end
  end


  end
end

describe 'guess' do
  it 'returns the guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Junea", card)
  expect(turn.guess). to eq("Junea")
  end
end

describe 'correct?' do
  it 'checks if the guess matches the answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Junea", card)
    expect(turn.correct?).to eq(true)
  end
end
