require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  it 'checks for accuracy' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)

    turn2 = Turn.new("Not Juneau", card)

    expect(turn.correct?).to eq(false)
  end

  it 'provides feedback' do
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")

    turn2 = Turn.new("Not Juneau", card)

    expect(turn.feedback).to eq("Incorrect.")
  end 
end
