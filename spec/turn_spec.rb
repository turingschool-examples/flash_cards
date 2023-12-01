require 'pry'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do 
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_a(Turn)
  end

  it 'has @answer, @card, can #guess, can see if guess is #correct?, give #feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card) 
     
    expect(turn.guess).to eq("Juneau")
    expect(turn.correct?).to be(true)  
    expect(turn.feedback).to eq("Correct!")
  end 
end









