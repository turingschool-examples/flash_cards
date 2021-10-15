require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  before(:each)do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'has a deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'begins with an empty turns array' do
    expect(@round.turns).to eq([])
  end

  it 'initial current card is the first card' do
    expect(@round.current_card).to eq(@card_1)
  end

  describe ' #take_turn' do
    it 'returns correct turn' do
      guess = 'Juneau'
      turn = @round.take_turn(guess)
      expect(turn).to be_instance_of(Turn)
      expect(turn.guess).to eq(guess)
      expect(turn.card).to eq(@card_1)
    end

    it 'shifts the deck' do
      guess = 'Juneau'
      @round.take_turn(guess)
      expect(@round.deck.cards[0]).to eq(@card_2)
    end

    it 'updates the current card' do
      guess = 'Juneau'
      expect(@round.current_card).to eq(@card_1)
      @round.take_turn(guess)
      expect(@round.current_card).to eq(@card_2)
    end
  end

  describe ' #number_correct' do
    it 'returns correct number correct' do
      @round.take_turn('Juneau')
      @round.take_turn('Mars')
      @round.take_turn('North north west')
      expect(@round.number_correct).to eq(3)
    end
  end

  describe ' #number_correct_by_category' do
    it 'returns correct number correct by category' do
      @round.take_turn('Juneau')
      @round.take_turn('Mars')
      @round.take_turn('North north west')
      expect(@round.number_correct_by_category(:STEM)).to eq(2)
    end
  end

  describe ' #percent_correct' do
    it 'returns correct percent' do
      @round.take_turn('Juneau')
      expect(@round.percent_correct).to eq(100)
      @round.take_turn('Venus')
      expect(@round.percent_correct).to eq(50)
      @round.take_turn('North north west')
      expect(@round.percent_correct).to eq(2.0/3*100)
    end
  end

  describe ' #percent_correct_by_category' do
    it 'returns correct percent by category' do
      category = :STEM
      @round.take_turn('Juneau')
      expect(@round.percent_correct_by_category(category)).to eq(0)
      @round.take_turn('Mars')
      expect(@round.percent_correct_by_category(category)).to eq(100)
      @round.take_turn('North north')
      expect(@round.percent_correct_by_category(category)).to eq(50)
    end
  end
end
