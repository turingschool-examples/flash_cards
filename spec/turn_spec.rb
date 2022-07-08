require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
    @turn = Turn.new('Juneau', @card)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq('Juneau')
  end

  it 'has a card' do
    expect(@turn.card.question).to eq('What is the capital of Alaska?')
    expect(@turn.card.answer).to eq('Juneau')
    expect(@turn.card.category).to eq(:Geography)
  end

  it 'guesses an answer' do
    expect(@turn.guess).to eq(@card.answer)
  end

  it 'provides feedback' do
    expect(@turn.feedback).to eq('Correct!')
  end

  it 'handles wrong answers' do
    card = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
    turn = Turn.new('Saturn', card)
    expect(turn.feedback).to eq('Incorrect.')
  end
end
