require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  before all do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", card)
  end

  it 'can return card' do
    expect(@turn.card).to eq("What is the capital of Alaska?", "Juneau", :Geography)
  end

  xit 'can return guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  xit 'can evaluate guess and give feedback' do
    expect(@turn.correct?).to eq(true)

    expect(@turn.feedback).to eq("Correct!")
  end

end
