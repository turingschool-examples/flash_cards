require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before :each do
    @card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @turn = Turn.new('Juneau', @card)
    @turn_2 = Turn.new(' jUnEaU   ', @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'returns the guess with the guess method' do
    expect(@turn.guess).to eq('Juneau')
  end

  it 'returns the Card with the card method' do
    expect(@turn.card).to eq(@card)
  end

  it 'confirms if the guess is correct' do
    expect(@turn.correct?).to be true
  end

  it 'is not case sensitive and leading and trailing whitespace is ok' do
    expect(@turn_2.correct?).to be true
  end

  it 'provides positive feedback if correct' do
    expect(@turn.feedback).to eq('Correct!')
  end
end

RSpec.describe Turn do
  before :each do
    @card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    @turn = Turn.new('Saturn', @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'returns the guess with the guess method' do
    expect(@turn.guess).to eq('Saturn')
  end

  it 'returns the Card with the card method' do
    expect(@turn.card).to eq(@card)
  end

  it 'confirms if the guess is incorrect' do
    expect(@turn.correct?).to be false
  end

  it 'provides negative feedback if incorrect' do
    expect(@turn.feedback).to eq('Incorrect.')
  end
end
