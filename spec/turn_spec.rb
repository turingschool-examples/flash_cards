require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  before(:all) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    expect(@turn.card).to be_instance_of(Card)
  end

  it 'tests if guess is correct' do
    expect(@turn.correct?).to eq(true)
  end

  it 'tests if feedback returns \'Correct!\'' do
    expect(@turn.feedback).to eq("Correct!")
  end

  it 'tests if feedback returns \'Incorrect.\'' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Denver", card)

    expect(turn.feedback).to eq("Incorrect.")
  end
end
