require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Boston" , card)

    expect(turn).to be_instance_of(Turn)
  end
  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Boston" , card)
    expect(turn.guess).to eq("Boston")

  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Boston" , card)
    expect(turn.card).to eq(card)
  end

  it 'is checking answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Boston" , card)
    expect(turn.correct?).to eq(true)
  end

  
end