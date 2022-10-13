require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  #test if it exists
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

#test it has a Card
  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(card).to be_instance_of(Card)
  end
#test it has a guess
it 'has a guess' do
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

expect(turn.guess).to eq("Juneau")
end
#test if correct?
it 'is correct?'do
card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
turn = Turn.new("Juneau", card)

expect turn.correct?
#test feedback
end
