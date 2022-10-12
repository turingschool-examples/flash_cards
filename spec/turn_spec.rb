require './lib/turn'

RSpec.decribe Turn do
  it 'exist' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau",card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    turn = Turn.new("Juneau",card)

    expect(turn.card).to eq(card)
  end
