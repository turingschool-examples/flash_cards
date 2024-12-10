require 'pry'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before(:each) do
      @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      @turn1 = Turn.new("Juneau", @card1)
      @turn2 = Turn.new("Saturn", @card2)
    end 

    it 'exists' do 
      expect(@turn1).to be_a(Turn)
    end

    it '#card returns the card object associated with the turn' do 
      expect(@turn1.card).to eq(@card1) 
    end

    describe '#correct?' do 
      it 'can check if the guess is correct' do 
          expect(@turn1.correct?).to eq(true)
        end

      it 'can check if the guess is incorrect' do
          expect(@turn2.correct?).to eq(false)
        end

      it 'is case insensitive when checking guesses' do
          turn = Turn.new("juneau", @card1)
          expect(turn.correct?).to eq(true)
        end

      it 'ignores leading and trailing whitespace when checking guesses' do
          turn = Turn.new("  Juneau  ", @card1)
          expect(turn.correct?).to eq(true)
        end
    end

    describe '#feedback' do
      it 'can give feedback on both correct and incorrect guesses' do
          expect(@turn1.feedback).to eq("Correct!")
          expect(@turn2.feedback).to eq("Incorrect.")
        end
    end
end
