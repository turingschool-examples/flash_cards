require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :State_Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck   = Deck.new([@card_1, @card_2, @card_3])
    @round  = Round.new(@deck)
  end

  it 'exists & has attributes' do
    expect(@round).to be_a(Round)
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  it 'returns current card' do
    expect(@round.current_card).to eq(@card_1)
  end

  describe 'new turns' do
    before(:each) do
      @new_turn = @round.take_turn("Juneau")
    end

    it 'takes a new turn' do
      expect(@new_turn.class).to eq(Turn)
      expect(@new_turn.correct?).to eq(true)
      expect(@round.turns).to eq([@new_turn])
      expect(@round.number_correct).to eq(1)
      expect(@round.current_card).to eq(@card_2)

      @round.take_turn("Venus")

      expect(@round.turns.count).to eq(2)
      expect(@round.turns.last.feedback).to eq("Incorrect.")
      expect(@round.number_correct).to eq(1)
    end

    it 'returns number_correct_by_category' do
      expect(@round.number_correct_by_category(:State_Geography)).to eq(1)
      expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'returns percent_correct' do
      @round.take_turn("Venus")

      expect(@round.percent_correct).to eq(50.0)
      expect(@round.percent_correct_by_category(:State_Geography)).to eq(100.0)
      expect(@round.current_card).to eq(@card_3)
    end

    it 'lists categories' do
      expect(@round.categories).to eq([:State_Geography, :STEM])
    end

    it 'lists categories as strings' do
      expect(@round.categories_strings).to eq(['State Geography', 'STEM'])
    end
  end
end
