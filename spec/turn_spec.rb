require './lib/card'
require './lib/turn'


RSpec.describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  it 'exists' do
    expect(card).to be_a(Card)
    expect(turn).to be_a(Turn)
  end

  it 'has a card' do
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    expect(turn.guess).to eq("Juneau")
  end

  it 'can return a boolean for guess' do
    expect(turn.correct?).to eq(true)
  end

  it 'can give feedback' do
    expect(turn.feedback).to eq("Correct!")
  end

  it 'has a card with incorrect guess' do

    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    turn = Turn.new("Saturn", card)
    
    expect(turn.card).to eq(card)
  end

end
