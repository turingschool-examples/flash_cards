require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'shows current card' do
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  it 'gives feedback' do
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq('Correct!')
  end

end
