require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  let (:card1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
  
  let (:turn1) {Turn.new("Juneau", card1)}
  
  it 'exists' do
    expect(turn1).to be_a(Turn)
  end
  
  it 'has a card' do
    expect(turn1.card).to eq(card1)
  end
  
  it 'has a guess' do
    expect(turn1.guess).to eq("Juneau")
  end
  
  it 'can determine if an answer is correct' do
    expect(turn1.correct?).to eq(true)
  end
  
  xit 'has feedback after an answer is recieved' do
  end

  
end