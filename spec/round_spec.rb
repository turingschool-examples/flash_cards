require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end
  
  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it "has a deck ready" do
    expect(@round.deck).to eq @deck
  end

  it "Has a current card" do
    expect(@round.current_card).to eq @card_1
  end

  it "Starts with no turns" do
    expect(@round.turns).to eq []
  end

  it "Can take turns" do
    expect(@round.current_card).to eq @card_1
    
    expect(@round.take_turn("Juneau")).to eq @round.turns[0]
    
    expect(@round.current_card).to eq @card_2   
  end

  it "Can tell if the new turn is correct" do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.class).to eq Turn
    expect(new_turn.correct?).to eq true
    new_turn = @round.take_turn("Boston")
    expect(new_turn.class).to eq Turn
    expect(new_turn.correct?).to eq false
  end

  it "Can store the turns" do
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns).to eq [new_turn]
  end

  it "Can take more turns" do
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns.count).to eq 1
    new_turn_2 = @round.take_turn("Venus")
    expect(@round.turns.count).to eq 2
  end

  it "Can give feedback on the last turn" do
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns.last.feedback).to eq "Correct!"
    new_turn_2 = @round.take_turn("Venus")
    expect(@round.turns.last.feedback).to eq "Incorrect."
  end

  it "Can tell how many correct guesses" do 
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")
    expect(@round.number_correct).to eq 1
  end

  it "Can tell how many correct guesses by category" do
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")
    expect(@round.number_correct_by_category(:Geography)).to eq 1
    expect(@round.number_correct_by_category(:STEM)).to eq 0
  end

  it "Can return the percentage of corrects" do 
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")
    expect(@round.percent_correct).to be 50.0
  end

  it "Can tell the percentage of corrects by category" do
    new_turn = @round.take_turn("Juneau")
    new_turn_2 = @round.take_turn("Venus")
    expect(@round.percent_correct_by_category(:Geography)).to be 100.0
  end

end
