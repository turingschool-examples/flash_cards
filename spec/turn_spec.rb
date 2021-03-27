require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq(@guess)
  end

  it 'accepts a card' do
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(@card)
  end

  it 'checks correct answer' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end
