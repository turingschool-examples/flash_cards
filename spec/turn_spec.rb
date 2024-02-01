require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'returns a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    guess = turn.new("Denver", card)

    expect(turn.guess).to eq "Denver"
  end
end