require 'rspec'
require './lib/card'
require './lib/turn'
require './lib/round'
require './lib/deck'

RSpec.describe Round do

  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  describe 'class checks' do
    it 'is an instance of round' do
      expect(@round).to be_a(Round)
    end

    it 'is an instance of deck' do
      expect(@round.deck).to eq(@deck)
    end

    it 'is an instance of turn' do
      new_turn = @round.take_turn("Juneau")

      expect(new_turn.class).to eq(Turn)
    end
  end

  describe 'default values' do
    it 'turn is an array by default' do
      expect(@round.turns).to eq([])
    end

    it 'starts on turn number one' do
      expect(@round.turn_num).to eq(1)
    end
  end

  describe 'current card' do
    it 'test current card is correct' do
      expect(@round.current_card).to eq(@card_1)

      @round.take_turn("Juneau")

      expect(@round.current_card).to eq(@card_2)

      @round.take_turn("Mars")

      expect(@round.current_card).to eq(@card_3)

      @round.take_turn("North north west")

      expect(@round.current_card).to eq(nil)
    end
  end
  describe 'turn results' do
    it 'test guess is correct/incorrect' do
      new_turn = @round.take_turn("Juneau")

      expect(new_turn.correct?).to be true

      new_turn_2 = @round.take_turn("Venus")

      expect(new_turn_2.correct?).to be false
    end

    it 'updates the turns array after a guess' do
      new_turn = @round.take_turn("Juneau")

      expect([new_turn]).to eq(@round.turns)

      @round.take_turn("Mars")

      expect(@round.turns.count).to eq(2)
    end

    it 'takes answers that are not capitalized' do
      new_turn = @round.take_turn("juneau")

      expect(new_turn.correct?).to be true
    end

    it 'tests for correct/incorrect feedback' do
      @round.take_turn("Juneau")

      expect(@round.turns.last.feedback).to eq('Correct!')

      @round.take_turn("Venus")

      expect(@round.turns.last.feedback).to eq('Incorrect.')
    end
    it 'test number of correct guesses' do
      expect(@round.number_correct).to eq(0)

      @round.take_turn("Juneau")

      expect(@round.number_correct).to eq(1)

      @round.take_turn("Venus")

      expect(@round.number_correct).to eq(1)
    end

    it 'test number correct by category' do
      @round.take_turn("Juneau")

      expect(@round.number_correct_by_category(:Geography)).to eq(1)

      @round.take_turn("Venus")

      expect(@round.number_correct_by_category(:STEM)).to eq(0)

      @round.take_turn("North north west")

      expect(@round.number_correct_by_category(:STEM)).to eq(1)
    end

    it 'testing percentage correct' do
      expect(@round.percent_correct).to eq('Not Enough Data')

      @round.take_turn("Juneau")

      expect(@round.percent_correct).to eq(100.0)

      @round.take_turn("Venus")

      expect(@round.percent_correct).to eq(50.0)
    end

    it 'testing percentage correct by category' do
      expect(@round.percent_correct_by_category(:STEM)).to eq('Not Enough Data')

      @round.take_turn("Juneau")
      @round.take_turn("Venus")

      expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)

      @round.take_turn("north north west")

      expect(@round.percent_correct_by_category(:STEM)).to eq(50.0)
    end
  end
end
