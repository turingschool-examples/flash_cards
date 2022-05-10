require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'card exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end

  it 'turn exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'card can be called' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.card).to eq(card)
  end

  it 'guess can be called' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.guess
    expect(turn.guess).to eq('Juneau')
  end

  it 'can determine if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.correct?
    expect(turn.correct?).to eq true 
  end
end
