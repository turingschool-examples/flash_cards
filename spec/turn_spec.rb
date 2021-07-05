require './lib/turn'
require './lib/card'
RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exits & has attriubtes' do
    expect(@turn).to be_a(Turn)
    expect(@turn.card).to eq(@card)
    expect(@turn.guess).to eq("Juneau")
    expect(@turn.correct?).to eq(true)
    expect(@turn.feedback).to eq("Correct!")
  end
end 
