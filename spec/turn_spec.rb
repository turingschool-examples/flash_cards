require './lib/turn'
require './lib/card'

RSpec.describe Turn do 
  
  before :each do 
    @card = Card.new("What is the capital of California?", "Sacramento", :Geography)
    @turn = Turn.new("Sacramento", @card)
  end 
  it 'exists' do 
    expect(@turn).to be_instance_of(Turn)
  end 
  it 'returns a card' do
    expect(@turn.card).to eq(@card)
  end 
  it 'returns a guess' do 
    expect(@turn.guess).to eq("Sacramento")
  end 
  it 'returns correct?' do
    expect(@turn.correct?).to eq(true)
  end 
  it 'returns feedback' do
    expect(@turn.feedback).to eq("Correct!")
  end 
end   
