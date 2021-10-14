require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end
  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'has a deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'is checking the turn' do
    expect(@round.turns).to eq([])
  end

  it 'has a current card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'takes a new turn' do
    expect(@round.take_turn("Juneau")).to be_instance_of(Turn)
  end
  describe 'taking a turn' do
    before :each do
      @new_turn = @round.take_turn("Juneau")
    end
    it 'has a class' do
      expect(@new_turn.class).to eq(Turn)
    end

    it 'checks if answer is correct' do
      expect(@new_turn.correct?).to eq(true)
    end

    it 'returns an array of the turn' do
      expect(@round.turns).to eq([@new_turn])
    end

    it "checks if the number is correct" do
      expect(@round.number_correct).to eq(1)
    end

    xit "checks if card2" do
      expect(@round.current_card).to eq(@card_2)
    end
  end
end
