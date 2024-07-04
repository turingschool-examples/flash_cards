require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'



RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards) # the array of cards object
    @round = Round.new(@deck)
    
  end



  it "has a deck that is a deck object" do
    expect(@round.deck).to be_instance_of(Deck)
  end

  it "has a turns attribute that is a list" do
    expect(@round.turns).to eq([])
  end

  it "keeps track of the current card" do
    expect(@round.currnet_card).to be_instance_of(Card)
  end

  it "will produce a whole new turn object" do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn).to be_instance_of(Turn)
  end

  it "produces a functioning Turn object" do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.correct?).to eq(true)
  end






end