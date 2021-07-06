require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'returns the guess with the guess method' do
    expect(@turn.guess).to eq("Juneau")
  end

  it 'returns the Card with the card method' do
    expect(@turn.card).to eq(@card)
  end

  it 'confirms if the guess is Correct' do
    expect(@turn.correct?).to be true
  end

  it 'provides feedback' do
    expect(@turn.feedback).to eq('Correct!')
  end
end
