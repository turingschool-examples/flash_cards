require 'pry'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do 
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)

    expect(turn_1).to be_a(Turn)
  end

  it 'has @answer, @card, can #guess, can see if guess is #correct?, give #feedback' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1) 

    expect(turn_1.guess).to eq("Juneau")
    expect(turn_1.correct?).to be(true)  
    expect(turn_1.feedback).to eq("Correct!")
  end 

  it "can test for incorrect guesses" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn_1 = Turn.new("Juneau", card_1)
    turn_2 = Turn.new("Saturn", card_2)

    expect(turn_2.card).to eq(card_2)
    expect(turn_2.guess).to eq("Saturn")
    expect(turn_2.correct?).to be false
    expect(turn_2.feedback).to eq("Incorrect")
  end
end









