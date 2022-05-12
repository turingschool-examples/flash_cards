require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before :each do
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @new_turn = Turn.new("Juneau", @card1)
  end

  it "exists" do
    expect(@round).to be_an(Round)
  end

  it "has attributes" do
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  it "can check the current card" do
    expect(@round.current_card).to eq(@card1)
  end

  it "can take a new turn" do
    @round.take_turn("Juneau")
    expect(@round.current_card).to eq(@card2)
  end

  it "can check the number of correct turns" do
    @round.take_turn("Juneau")
    expect(@round.current_card).to eq(@card2)
    expect(@new_turn.correct?).to eq(true)
    expect(@round.number_correct).to eq(1)
  end

  it "can count the number correct by the category" do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.current_card).to eq(@card3)
    expect(@round.turns.count).to eq(2)
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:Stem)).to eq(0)
  end

  it "check the percent of correct turns" do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.percent_correct).to eq(50.0)
  end

  it "can check the percent correct by the category" do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
  end
end
