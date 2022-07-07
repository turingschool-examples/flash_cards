require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'shows current card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)

    turn = Turn.new("Saturn", card)

    expect(turn.card).to eq(card)
  end

  it 'gives feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq('Correct!')

    turn = Turn.new("Saturn", card)

    expect(turn.feedback).to eq('Incorrect.')
  end

end
