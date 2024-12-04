require 'rspec'
require '../lib/turn'
require '../lib/card'

describe Card do
  it 'exists and is initialized' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end
end

describe Turn do
  it 'exists and is initalized' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_a(Turn)
  end

  it 'has a card attr_reader' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.card).to eq(card)
  end

  it 'has a guess attr_reader' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq("Juneau")
  end

  it 'has a working correct? method' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to eq(true)
  end

  it 'has a working feedback method' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end
end

