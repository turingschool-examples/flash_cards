require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)

    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  describe '#initialize' do
    it 'creates an instance of Round' do
      expect(@round).to be_a(Round)
    end
  end

  describe 'deck' do
    it 'contains the input deck' do
      expect(@round.deck).to be_a(Deck)
    end
  end

  #Change to one or more turns
  describe 'turns' do
    it 'tracks turns taken' do
      @round.take_turn("Juneau")
      expect(@round.turns.size).to eq(1)
    end
  end

  describe '#current_card' do
    it 'displays current card' do
      expect(@round.current_card).to eq(@card_1)
    end
  end

  describe '#take_turn' do
    it 'creates new Turn instance' do
      expect(@round.take_turn("Juneau")).to be_a(Turn)
    end

    it 'moves to the next card' do
      @round.take_turn("Juneau")
      expect(@round.current_card).to eq(@card_2)
    end
  end

  describe '#number_correct' do
    it 'counts correct answers' do
      @round.take_turn("Juneau")
      expect(@round.number_correct).to eq(1)

      @round.take_turn("Mars")
      expect(@round.number_correct).to eq(2)
    end
  end

  describe '#number_correct_by_category' do
    it 'counts correct answers by category' do
      @round.take_turn("Juneau")
      @round.take_turn("Mars")
      @round.take_turn("North north west")

      expect(@round.number_correct_by_category(:STEM)).to eq(2)
    end
  end

  describe '#percent_correct' do
    it 'calculates correct percentage' do
      @round.take_turn("Juneau")
      @round.take_turn("Mars")
      @round.take_turn("Weeste by Southeeste")

      expect(@round.percent_correct).to eq(67)
    end
  end

  describe '#percent_correct_by_category' do
    it 'calculates correct answers by category' do
      @round.take_turn("Juneau")
      @round.take_turn("Mars")
      @round.take_turn("Weeste by Southeeste")

      expect(@round.percent_correct_by_category(:STEM)).to eq(50)
    end
  end

end
