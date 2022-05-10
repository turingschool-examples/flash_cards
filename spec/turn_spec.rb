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
  turn = Turn.new('Juneau',card)

  expect(turn.correct?).to be true
  end
end
