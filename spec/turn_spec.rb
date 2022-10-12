require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do

# test it exists
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

# test it has a card
  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to be_instance_of(Card)
  end

# test it has a guess
  xit 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

# test correct?
  xit 'guess correct' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to be true
  end

# test return feedback
  xit 'feedback return correct' do
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end
end
