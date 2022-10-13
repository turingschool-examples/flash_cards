require './lib/turn'

describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau",current_card)

    expect(turn).to be_a Turn
  end

  it 'has an answer' do
    turn = Turn.new("Juneau",current_card)

    expect(turn.guess).to eq "Juneau"
  end

  it 'corresponds to a card' do
    turn = Turn.new("Juneau",current_card)

    expect(turn.card).to eq current_card
  end
end
