# frozen_string_literal: true

require_relative '../lib/card'
require_relative '../lib/turn'
require 'rspec'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.guess).to eq('Juneau')
  end

  it 'has a card' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.card).to eq(card)
  end

  it 'can confirm correct guess' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.correct?).to be true
  end

  it 'can provide feedback' do
    card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    turn = Turn.new('Juneau', card)

    expect(turn.feedback).to eq('Correct!')
  end
end
