require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  describe 'Iteration 2' do
    before :each do
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      @deck = Deck.new([@card_1, @card_2, @card_3])
      @round = Round.new(@deck)
    end

    it 'exists' do
      expect(@round).to be_a(Round)
    end

    it 'has attributes' do
      expect(@round.deck).to eq(@deck)
      expect(@round.turns).to eq([])
    end

    it 'can tell current card (at index 0)' do
      expect(@round.current_card).to eq(@card_1)
    end

    describe 'take some turns' do
      before :each do
        @new_turn = @round.take_turn("Juneau")
      end

      it 'can take a turn, check validity, and add to turns' do
        expect(@new_turn.class).to eq(Turn)
        expect(@new_turn.correct?).to eq(true)
        expect(@round.turns).to eq([@new_turn])
      end

      it 'can tell the number correct' do
        expect(@round.number_correct).to eq(1)
      end

      it 'can update current card' do
        expect(@round.current_card).to eq(@card_2)
      end

      describe 'take more turns' do
        before :each do
          @new_turn_2 = @round.take_turn("Venus")
        end

        it 'can count turns' do
          expect(@round.turns.count).to eq(2)
          expect(@round.turns).to eq([@new_turn, @new_turn_2]) #bonus test
        end

        it 'can give feedback for last test' do
          expect(@round.turns.last.feedback).to eq("Incorrect.")
        end

        it 'can tell number correct' do
          expect(@round.number_correct).to eq(1)
        end

        it 'can tell number correct by category' do
          expect(@round.number_correct_by_category(:Geography)).to eq(1)
          # expect(@round.number_correct_by_category(:STEM)).to eq(0)
        end

        it 'can tell percent correct' do
          expect(@round.percent_correct).to eq(50.0)
        end

        xit 'can tell percent correct by category' do
          expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
        end

        xit 'can tell current card' do
          expect(@round.current_card).to eq(@card_3)
        end

      end

    end

  end

end
