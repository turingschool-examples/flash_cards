require 'spec_helper'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn).to be_a Turn
  end

  it 'turns a card' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.card).to eq(card)
  end

  it 'returns a guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.guess).to eq('Juneau')
  end

  it 'determines if the guess is correct and gives feedback' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.correct?).to eq(true)
    expect(turn.feedback).to eq('Correct!')

    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)

    expect(turn.card).to eq(card)
    expect(turn.guess).to eq('Saturn')
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq('Incorrect.')
  end
end
