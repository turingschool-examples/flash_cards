require 'pry'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  let (:card_1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
  
  let (:card_2) {Card.new("Which planet is closest to the sun?", "Mercury", :STEM)}

  let (:turn_1) {Turn.new("Juneau", card_1)}
  let (:turn_2) {Turn.new("Saturn", card_2)}
  

  it 'exists' do
    expect(turn_1).to be_a(Turn)
  end

  it 'has a card' do
    expect(turn_1.card).to eq(card_1)
  end

  it 'has a guess' do
    expect(turn_1.guess).to eq("Juneau")
  end

  it 'can determine if an answer is correct' do
    expect(turn_1.correct?).to eq(true)
    expect(turn_2.correct?).to eq(false)
  end

  it 'returns feedback after an answer is recieved' do
    expect(turn_1.feedback).to eq("Correct!")
    expect(turn_2.feedback).to eq("Incorrect!")
  end
end