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

  it 'shows current card' do
    expect(@turn.card).to eq(@card)

    @turn = Turn.new("Saturn", @card)
    expect(@turn.card).to eq(@card)
  end

  it 'shows if guess is correct' do
    expect(@turn.correct?).to eq(true) 
    
    @turn = Turn.new("Denver", @card)
    expect(@turn.correct?).to eq(false)
  end 

  it 'gives feedback' do
    expect(@turn.feedback).to eq('Correct!')

    @turn = Turn.new("Saturn", @card)
    expect(@turn.feedback).to eq('Incorrect.')
  end

end
