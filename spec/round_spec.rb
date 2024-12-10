require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do 
    before(:each) do 
        @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card1, @card2, @card3]
        @deck = Deck.new(@cards) 
        @round = Round.new(@deck)
    end

    it 'exists' do
        expect(@round).to be_a(Round)
    end

    describe '#current_card' do
      it 'checks for the current card at the front of the deck' do
          expect(@round.current_card).to eq(@card1)
        end
    end

    describe '#take_turn' do
      it 'creates and records a new turn for the round' do 
          new_turn = @round.take_turn("Juneau")

          expect(new_turn.class).to eq(Turn)
          expect(new_turn.correct?).to eq(true)
        end
    end

    describe '#turns and #turn_count' do
      it 'counts the number of turns taken' do 
          expect(@round.turn_count).to eq(0)
        
          @round.take_turn("Juneau")
          @round.take_turn("Venus")

          expect(@round.turns.count).to eq(2)
        end
    end

    describe '#last_turn' do
    it 'determines the last turn taken' do
        turn1 = @round.take_turn("Juneau")
        turn2 = @round.take_turn("Venus")

        expect(@round.last_turn).to eq(turn2)
        expect(@round.last_turn.guess).to eq("Venus")
        expect(@round.last_turn.feedback).to eq("Incorrect.")
        end
    end

    describe '#number_correct' do
      it 'records the total number of correct answers in the turns array' do
          @round.take_turn("Juneau")
          expect(@round.number_correct).to eq(1)

          @round.take_turn("Venus")
          expect(@round.number_correct).to eq(1)
        end
    end

    describe '#correct_by_category' do
      it 'records the number of correct answers for each category' do
          @round.take_turn("Juneau")

          expect(@round.correct_by_category(:Geography)).to eq(1)
          expect(@round.correct_by_category(:STEM)).to eq(0)
        end
    end

    describe '#percent_correct' do
      it 'returns the current percentage of correct answers' do 
        @round.take_turn("Juneau")
        @round.take_turn("Venus")

        expect(@round.number_correct).to eq(1)
        expect(@round.percent_correct).to eq(50.0)
      end
    end

    describe '#percent_correct_by_category' do
      it 'returns the current percentage of correct answers by category' do 
        @round.take_turn("Juneau")
        @round.take_turn("Venus")

        expect(@round.correct_by_category(:Geography)).to eq(1)
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
      end
    end
end