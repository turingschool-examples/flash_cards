require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", card)
  end

  it 'is initialized with a card object and a guess string' do
    expect(@turn).to be_instance_of Turn
  end

  it 'contains and can return a single card' do
    expect(@turn.card).to be_instance_of Card
  end

  it 'can return the inputted guess' do
    expect(@turn.guess).to eq('Juneau')
  end

  it 'returns true if the guess matches the answer' do
    expect(@turn.correct?).to be true
  end

  it 'returns false if the guess does not match' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Anchorage", card)
    expect(@turn.correct?).to be false
  end

  it 'returns feedback if guess is correct' do
    expect(@turn.feedback).to eq('Correct')
  end

  it 'returns feedback if guess is not correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Anchorage", card)
    expect(@turn.feedback).to eq('Incorrect')
  end
end
