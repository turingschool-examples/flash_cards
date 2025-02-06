require './lib/turn'
require './lib/card'
require 'rspec'

describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau")
    @turn = Turn.new("Juneau", @card)
    @turn_incorrect = Turn.new("Anchorage", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    expect(@turn.card).to eq(@card)
  end

  it 'can be correct' do
    expect(@turn.correct?).to be true
  end

  it 'can be incorrect' do
    expect(@turn_incorrect.correct?).to be false
  end

  it 'gives feedback' do
    expect(@turn.feedback).to eq("Correct!")
    expect(@turn_incorrect.feedback).to eq("Incorrect.")
  end
end
