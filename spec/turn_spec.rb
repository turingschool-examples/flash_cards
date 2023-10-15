require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", card)
  end
  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a guess' do

    expect(@turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    expect(@turn.card).to be_an_instance_of(Card)
  end

  it 'is correct' do
    expect(@turn.correct?).to eq(true)
  end

  it 'is incorrect' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to eq(false)
  end

  it 'provides feedback that an answer is Incorrect' do
    expect(@turn.feedback).to eq("Correct!")
  end

  it 'provides feedback that an answer is Incorrect' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.feedback).to eq("Incorrect.")
  end
end