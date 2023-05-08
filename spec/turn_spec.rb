require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it "exists" do
  card = Card.new("How many licks to get to center of tootsie pop?", 525600,:candy)
  turn1 = Turn.new(100000,card)
  
  expect(turn1).to be_instance_of(Turn)
  end

  it "has a guess" do
    card = Card.new("How many licks to get to center of tootsie pop?", 525600,:candy)
    turn1 = Turn.new(100000,card)
    
    expect(turn1.guess).to eq(100000)
  end

  it "has a card" do
    card = Card.new("How many licks to get to center of tootsie pop?", 525600,:candy)
    turn1 = Turn.new(100000,card)
    
    expect(turn1.card).to eq(card) # accesses card variable as defined above
  end

  it "determines if correct guess given" do
    card = Card.new("How many licks to get to center of tootsie pop?", 525600,:candy)
    turn1 = Turn.new(100000,card)
    expect(turn1.correct?).to be false
    
    turn2 = Turn.new(525600,card)
    expect(turn2.correct?).to be true
  end

  it "gives feedback based on correctness" do
    card = Card.new("How many licks to get to center of tootsie pop?", 525600,:candy)
    turn1 = Turn.new(100000,card)
    expect(turn1.feedback).to eq("Incorrect.")
    
    turn2 = Turn.new(525600,card)
    expect(turn2.feedback).to eq("Correct!")
  end

  it "also gives feedback on incorrect data types" do
    card = Card.new("How many licks to get to center of tootsie pop?", 525600,:candy)
    turn3 = Turn.new("six hundred",card)
    
    expect(turn3.feedback).to eq("Incorrect. You entered a String, please enter in Integer format.")
  end
end