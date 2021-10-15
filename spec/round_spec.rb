require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe "round" do
  before(:each) do
    @card_1   = Card.new("What is the capital of Alaska?",
                       "Juneau",
                       :Geography)
    @card_2   = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
                       "Mars",
                       :STEM)
    @card_3   = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?",
                       "North north west",
                       :STEM)
    @deck     = Deck.new([@card_1, @card_2, @card_3])
    @round    = Round.new(@deck)
  end

  it "exists" do
    expect(@round).to be_a Round
  end

  it "has attributes" do
    expect(@round.deck).to be_a Deck
    expect(@round.deck).to eq(@deck)
    expect(@round.turns).to eq([])
  end

  it "can tell you the current card" do
    expect(@round.current_card).to eq(@card_1)
  end

  it "can take a turn" do
    new_turn = @round.take_turn("Juneau")

    expect(new_turn).to be_a Turn
    expect(new_turn.correct?).to be(true)
  end

  it "can keep track of turns" do
    new_turn = @round.take_turn("Juneau")

    expect(@round.turns).to eq([new_turn])
    expect(@round.turns.count).to eq(1)

    new_turn_2 = @round.take_turn("Mars")

    expect(@round.turns).to eq([new_turn, new_turn_2])
    expect(@round.turns.count).to eq(2)
  end

  it "removes cards from the deck that have been used in a turn" do
    new_turn   = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Mars")

    expect(@round.turns).to eq([new_turn, new_turn_2])
    expect(@round.deck.cards).to eq([@card_3])
  end

  it "can tell you how many correct responses there are" do
    new_turn   = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Earth")

    expect(new_turn.correct?).to eq true
    expect(new_turn_2.correct?).to eq false
    expect(@round.number_correct).to eq 1

    new_turn_3 = @round.take_turn("North north west")

    expect(@round.number_correct).to eq 2
    expect(@round.turns.last.feedback).to eq("Correct!")
  end

  it "can show how many correct responses there are for a given category" do
    

  end


end
