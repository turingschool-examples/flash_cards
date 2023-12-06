require 'rspec'
require './lib/turn'


RSpec.describe Turn do
    describe 'initialize' do
      it 'creates a new Turn instance with guess and card' do
        card = Card.new("What is the capital of Alaska?", "Juneau")
        turn = Turn.new("Juneau", card)
        
        expect(turn).to be_an_instance_of(Turn)
        expect(turn.guess).to eq("Juneau")
        expect(turn.card).to eq(card)
      end
  end

  describe 'correct?' do
    it 'returns true if the guess is correct' do
      turn = Turn.new("Juneau", card)
      expect(turn.correct?).to be true
    end

    it 'returns false if the guess is incorrect' do
      turn = Turn.new("Denver", card)
      expect(turn.correct?).to be false
    end
  end

  describe 'feedback' do
    it 'returns "Correct!" if the guess is correct' do
      turn = Turn.new("Juneau", card)
      expect(turn.feedback).to eq("Correct!")
    end

    it 'returns "Incorrect." if the guess is incorrect' do
      turn = Turn.new("Denver", card)
      expect(turn.feedback).to eq("Incorrect.")
    end
  end
end


