require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before(:each) do
    @card  = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card1 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn  = Turn.new("Juneau", @card)
    @turn1 = Turn.new("Saturn", @card1)
  end

  it 'exits & has attriubtes' do
    expect(@turn).to be_a(Turn)
    expect(@turn.card).to eq(@card)
    expect(@turn.guess).to eq("Juneau")
    expect(@turn.correct?).to eq(true)
    expect(@turn.feedback).to eq("Correct!")
  end

  it 'returns card and feedback' do
    expect(@turn1.card).to eq(@card1)
    expect(@turn1.guess).to eq("Saturn")
    expect(@turn1.correct?).to eq(false)
    expect(@turn1.feedback).to eq("Incorrect.")
  end
end
