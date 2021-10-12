require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before :each do
    @card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @turn = Turn.new('Juneau', @card)
  end

  it 'is an instance of Turn class' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    expect(@turn.card).to eq(@card)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq('Juneau')
  end

  it '#correct?' do
    expect(@turn.correct?).to eq(true)

    turn2 = Turn.new("Saturn", @card)
    expect(turn2.correct?).to eq(false)
  end

  it '#feedback' do
    expect(@turn.feedback).to eq('Correct!')

    turn2 = Turn.new('Saturn', @card)
    expect(turn2.feedback).to eq('Incorrect.')
  end
end
