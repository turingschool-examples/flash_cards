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
  end

  describe 'second argument' do
    it 'accepts the second argument' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junea", card)
      expect(turn.card).to eq(card)
    end
  end

  describe 'guess' do
    it 'returns the guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junea", card)
      expect(turn.guess). to eq("Junea")
    end
  end

  describe 'correct? right answer' do
    it 'checks if the guess matches the answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Junea", card)
      expect(turn.correct?).to eq(true)
    end
  end

  describe 'correct? wrong answer' do
    it 'checks if the guess does not match the answer' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)
    end
  end



  # describe 'feedback' do
  #   it 'returns Correct!' do
  #     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #     turn = Turn.new("Junea", card)
  #     expect(turn.feedback).to eq("Correct!")
  #   end
  # end

  # describe 'feedback' do
  #   it 'returns Incorrect.' do
  #     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  #     turn = Turn.new("Saturn", card)
  #     expect(turn.feedback).to eq("Incorrect.")
  #   end
  # end
end
