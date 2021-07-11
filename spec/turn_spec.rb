require_relative 'spec_helper'

RSpec.describe(Turn) do
  it 'exists' do
    expect(Turn).to be_truthy
  end

  it 'can be initialized' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.guess).to eq('Juneau')
  end

  it 'returns correct when guess matches answer' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.correct?).to eq(true)
  end

  it 'returns incorrect when guess does not match answer' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Tokyo', card)
    expect(turn.correct?).to eq(false)
  end

  it 'gives feedback for correct answer' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.feedback).to eq('Correct!')
  end

  it 'gives feedback for incorrect answer' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Nope', card)
    expect(turn.feedback).to eq('Incorrect.')
  end
end
