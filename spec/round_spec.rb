require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/practice_round'

RSpec.describe Round do
  before do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @turn_1 = Turn.new("Juneau", @card_1)
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_a Round
  end
  
  it 'has readable attributes' do
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  describe '#current_card' do
    it 'can return the current_card' do
      expect(@round.current_card).to eq(@card_1)
    end
  end

  describe '#take_turn with #new_turn' do
    it 'can take a new_turn' do
      @new_turn = @round.take_turn("Juneau")
      
      expect(@new_turn).to be_a(Turn)
    end
  end
  # expect(@new_turn.correct?).to be true
  
  describe '#take_turn' do
    it 'can take a second turn' do
      @new_turn = @round.take_turn("Juneau")

      expect(@round.turns).to eq([@new_turn])
      expect(@round.number_correct).to eq(1)
      expect(@round.current_card).to eq(@card_2)
      
      @new_turn1 = @round.take_turn("Venus")
      require 'pry' ; binding.pry
      expect(@round.turns.count).to eq(2)
      expect(@round.turns.last.feedback).to eq("Incorrect")
      expect(@round.number_correct).to eq(1)
      expect(@round.current_card).to eq(@card_3)
    end
  end

  describe '#number_correct_by_category' do
    it 'can determine #number_correct_by_category' do

    end

    it 'calculates #percent_corrrect and ' do

    end
  end
end  
