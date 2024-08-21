require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'creates a turn' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Card)
  end

  it 'contains a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has correct guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess == card.answer).to eq true
  end

  it 'has incorrect guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess != card.answer).to eq true
  end

  it 'tell player they are correct' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess == card.answer).to eq true
  end

  it 'tell player they are incorrect' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess != card.answer).to eq true
  end
  
end