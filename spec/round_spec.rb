require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  describe '#initialize' do
    it 'should initialize an instance of Round' do

      expect(@round).to be_instance_of(Round)
    end
  end

  describe '@deck' do
    it 'has a deck of cards' do

      expect(@round.deck).to be_instance_of(Deck)
    end
  end

  describe '@turns' do
    it 'has an empty array of turns' do
      expect(@round.turns).to eq([])
    end
  end

  describe '#current card' do
    it 'has a current card' do
      expect(@round.current_card).to eq(@card_1)
    end
  end

  describe '#take turn' do
    it 'returns an instance of Turn' do
      new_turn = @round.take_turn("Juneau")

      expect(new_turn).to be_instance_of(Turn)
      expect(new_turn.correct?). to be true
      expect(@round.turns).to eq([new_turn])
      expect(@round.current_card).to eq(@card_2)
    end
  end

  describe '#number correct' do
    it 'returns the number of correct guesses' do
      @round.take_turn("Juneau")

      expect(@round.number_correct).to eq(1)
    end
  end

  describe '#current card' do
    it 'returns the next card in the deck as the current card' do
      @round.take_turn("Juneau")

      expect(@round.current_card).to eq(@card_2)
    end
  end

  describe '#take_turn' do
    it 'can make a second guess' do
      @round.take_turn("Juneau")
      @round.take_turn("Venus")

      expect(@round.turns.count).to eq(2)
      expect(@round.turns.last.feedback).to eq("Incorrect.")
    end
  end
end
