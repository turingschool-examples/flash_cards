require 'rspec'
require './turn'
require './card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau',card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau',card)

    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau',card)

    expect(turn.guess).to eq('Juneau')
  end

  it 'checks if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_right = Turn.new('Juneau',card)
    turn_wrong = Turn.new('Denver',card)

    expect(turn_right.correct?).to be true
    expect(turn_wrong.correct?).to be false
  end

  it 'provides feedback for guesses' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_right = Turn.new('Juneau',card)
    turn_wrong = Turn.new('Denver',card)

    expect(turn_right.feedback).to eq('Correct!')
    expect(turn_wrong.feedback).to eq('Incorrect.')
  end
end
