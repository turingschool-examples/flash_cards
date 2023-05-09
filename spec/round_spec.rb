require "./lib/card"
require "./lib/turn"
require "./lib/deck"
require "./lib/round"

RSpec.describe Round do

  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    
    @deck = Deck.new([@card_1, @card_2, @card_3])
    
    @round = Round.new(@deck)
  end

  it "exists with readable attributes" do
    expect(@round).to be_instance_of(Round)
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  it "has a current card method" do
    expect(@round.current_card).to eq(@card_1)
  end

  it "has a take_turn method" do
    new_turn = @round.take_turn("Juneau")
    
    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
    expect(@round.turns).to eq([new_turn])
  end
  
  it "has a number_correct method" do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
  end
end