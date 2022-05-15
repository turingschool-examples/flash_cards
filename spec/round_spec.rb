require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it "is an instance of round" do
    expect(@round).to be_a(Round)
  end

  it "has a deck of cards" do
    expect(@round.deck).to eq(@deck)
  end

  it "can tell you that turns are empty by default" do
    expect(@round.turns).to eq([])
  end

  it "can tell you what the current card is" do
    @round.take_turn("Juneau")
    expect(@round.current_card).to eq(@card_1)
  end

  it "can create an instance of Turn" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    expect(round.take_turn("Juneau")).to be_a(Turn)
  end

  it "can tell you that turn has a card" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    round.take_turn("Juneau")
    expect(round.current_card).to eq(card_1)
  end

  it "can count correct answers" do
    @round.take_turn("Juneau")
    # require 'pry' ; binding.prys
    expect(@round.number_correct).to eq(1)
  end

  it "can count the number of turns" do
    @round.take_turn("Juneau")
    expect(@round.turns.count).to eq(1)
  end

  it "can test for multiple turns taken" do
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    # require 'pry' ; binding.pry
    expect(@round.current_card).to eq(@card_2)
    expect(@round.number_correct).to eq(2)
    expect(@round.turns.count).to eq(2)
  end


end
