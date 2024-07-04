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

  it "loads the new Turn object it produces into the @turns array" do
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns.length).to eq(1)
    expect(@round.turns[0]).to be_instance_of(Turn)
  end

  it "can keep track of number of correct answers" do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
  end

  it "can keep cycling through the cards in the deck" do
    new_turn = @round.take_turn("Juneau")
    new_turn = @round.take_turn("Venus")
    expect(@round.currnet_card).to eq(@card_3)
    # expecting @card_3 as everytime you input new_turn, it fetches a new card
    expect(@round.turns.count).to eq(2)
  end

  it "it can provide feedback based on your answers" do
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns.last.feedback).to eq("Correct!")

    new_turn = @round.take_turn("Venus")
    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end




end