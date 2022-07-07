require './lib/turn'
require './lib/card'

describe Turn do 
  it 'exists' do 
    card = Card.new("What is the capital of California?", "Sacramento", :Geography)
    turn = Turn.new("Sacramento", card)
    expect(turn).to be_instance_of(Turn)
  end 
  it 'returns a card' do
    card = Card.new("What is the capital of California?", "Sacramento", :Geography)
    turn = Turn.new("Sacramento", card)
    expect(turn.card).to eq(card)
  end 
  it 'returns a guess' do 
    card = Card.new("What is the capital of California?", "Sacramento", :Geography)
    turn = Turn.new("Sacramento", card)
    expect(turn.guess).to eq("Sacramento")
  end 
  it 'returns correct?' do
    card = Card.new("What is the capital of California?", "Sacramento", :Geography)
    turn = Turn.new("Sacramento", card)
    expect(turn.correct?).to eq(true)
  end 
  it 'returns feedback' do
    card = Card.new("What is the capital of California?", "Sacramento", :Geography)
    turn = Turn.new("Sacramento", card)
    expect(turn.feedback).to eq("Correct!")
  end 
end   
