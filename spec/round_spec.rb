require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before(:each) do
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      @cards = [@card_1, @card_2, @card_3]
      @deck = Deck.new(@cards)
      @round = Round.new(@deck)
  end

  describe '#initialize' do
      it 'exists and has readable attributes' do
          expect(@round).to be_an_instance_of(Round)
          expect(@round.deck).to eq(@deck)
          expect(@round.turns).to eq([])
      end
  end

  describe '#current_card' do
      it 'can return the current card object' do
        expect(@round.current_card).to eq(@card_1)
      end
  end

  describe '#turns' do
    context 'when no turns have been taken' do
      it 'returns an empty array of the turn' do
        expect(@round.turns).to eq([])
      end
  end
    context ' when turns have been taken' do
      it 'check if the guess is correct' do
        new_turn = @round.take_turn("Juneau")
        expect(new_turn.correct?).to eq(true)
      end
    end
  end

  describe '#current_card' do
    # context 'when no turns have been taken' do
    #   it 'returns an array of the turns' do

    #   end
    # end
    context ' when one turns have been taken' do
      it 'returns the second card' do
        new_turn = @round.take_turn("Juneau")
        expect(@round.turns).to eq([new_turn])
      end
    end
  end

  describe '#number_correct' do
    # context 'when no turns have been taken' do
    #   it 'returns 0' do

    #   end
    # end
    context 'when turns have been taken' do
      it 'returns the number of correct turns' do
        new_turn = @round.take_turn("Juneau")
        expect(@round.number_correct).to eq(1)
      end
    end

    context 'checks lat feed back' do
        it 'can return a string based on guess' do
          new_turn = @round.take_turn("Juneau")
          new_turn = @round.take_turn("Venus")

          expect(@round.turns.last.feedback).to eq("Incorrect.")
        end
    end
  end

  describe '#number_correct_by_category(category)' do
    it 'returns the number of correct turns for the category' do
      new_turn = @round.take_turn("Juneau")
      new_turn = @round.take_turn("Venus")

      expect(@round.number_correct_by_category(:Geography)).to eq(1)
    end
  end

  describe '#percent_correct' do
    it 'returns the number of correct turns / the number of total turns (as a Float)' do
      new_turn = @round.take_turn("Juneau")
      new_turn = @round.take_turn("Venus")

      expect(@round.percent_correct).to eq(50.0)
    end
  end

  describe '#percent_correct_by_category(category)' do
    it 'returns the # of correct category turns / # of category turns' do
      new_turn = @round.take_turn("Juneau")
      new_turn = @round.take_turn("Venus")

      expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
  end
end