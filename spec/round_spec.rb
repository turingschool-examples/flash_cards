require "./lib/round"
require "./lib/deck"
require "./lib/card"
require "rspec"
require "pry"

describe Round do
  before(:each) do # same cards as the deck test, I just dont want to make global vars
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it "initialize" do 
    expect(@round).to be_instance_of(Round) 
  end

  it "has a deck" do
    expect(@round.deck).to eq(@deck) #=> #<Deck:0x00007fa160a38ed8...>

  end

  it "has turns" do
    expect(@round.turns).to eq([]) #=> []
  end

  it "has a current card" do
    expect(@round.current_card).to eq(@card_1) #=> #<Card:0x00007fa16104e160 @answer="Juneau", @question="What is the capital of Alaska?", @category=:Geography>
  end

  it "can take a turn" do
    new_turn = @round.take_turn("Juneau") # not putting in before(:each) do because I will reinvoke this below with different data #=> #<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">
    expect(new_turn).to be_instance_of(Turn) #=> Turn
    expect(new_turn.correct?).to be true #=> true
    expect(@round.turns).to eq([new_turn]) #=> [#<Turn:0x00007f99842f09e8 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>, @guess="Juneau">]
    expect(@round.number_correct).to eq(1) #=> 1
    expect(@round.current_card).to eq(@card_2) #=> #<Card:0x00007fa160a62e90 @answer="Mars", @question="The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", @category=:STEM>
  end

  it "can take another turn" do
    @round.take_turn("Juneau") 
    new_turn = @round.take_turn("Venus") #=> #<Turn:0x00007f972a215b38...>
    expect(new_turn).to be_instance_of(Turn) #=> 2
    expect(new_turn.correct?).to be false #=> false
    expect(@round.turns.count).to eq(2) #=> 2
    expect(@round.turns.last.feedback).to eq("Incorrect.") #=> "Incorrect."
    expect(@round.number_correct).to eq(1) #=> 1
    expect(@round.number_correct_by_category(:Geography)).to eq(1) #=> 1
    expect(@round.number_correct_by_category(:STEM)).to eq(0) #=> 0
    expect(@round.percent_correct).to eq(50.0) #=> 50.0
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0) #=> 100.0
    expect(@round.current_card).to eq(@card_3) #=> #<Card:0x00007fa161a136f0 @answer="North north west", @question="Describe in words the exact direction that is 697.5° clockwise from due north?", @category=:STEM>
  end
end