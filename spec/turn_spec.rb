require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before :each do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    expect(@turn.card).to eq(@card)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq('Juneau')
  end

  it 'returns true or false if guess is correct' do
    expect(@turn.correct?).to eq(true)

    incorrect_turn = Turn.new('Fairbanks', @card)
    expect(incorrect_turn.correct?).to eq(false)
  end
end
