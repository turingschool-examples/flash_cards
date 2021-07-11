require 'rspec'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  context 'initialize' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)


  it 'exists' do
    expect(turn).to be_an_instance_of(Turn)
  end

  it 'has cards' do
    expect(turn.card).to eq(card)
  end

  it 'has guesses' do
    expect(turn.guess).to eq("Juneau")
  end

  it 'is correct' do
    expect(turn.correct?).to eq(true)
  end

  it 'gives correct feedback' do
    expect(turn.feedback).to eq("Correct!")
  end

  it 'gives incorrect feedback' do
    turn2 = Turn.new("Fairbanks", card)
    expect(turn2.feedback).to eq("Incorrect.")
  end

end
end
