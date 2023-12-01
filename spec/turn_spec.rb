require 'pry'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do 
  it 'exists' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card1)

    expect(turn1).to be_a(Turn)
  end

  it 'has @answer, @card, can #guess, can see if guess is #correct?, give #feedback' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card1) 

    expect(turn1.guess).to eq("Juneau")
    expect(turn1.correct?).to be(true)  
    expect(turn1.feedback).to eq("Correct!")
  end 

  it "can test for incorrect guesses" do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn1 = Turn.new("Juneau", card1)
    turn2 = Turn.new("Saturn", card2)

    expect(turn2.card).to eq(card2)
    expect(turn2.guess).to eq("Saturn")
    expect(turn2.correct?).to be false
    expect(turn2.feedback).to eq("Incorrect")
  end
end









