require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  it 'can return card, guess and evauate guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card

    expect(turn.guess).to eq("Juneau")

    expect(turn.correct?).to eq(true)
  end


end
