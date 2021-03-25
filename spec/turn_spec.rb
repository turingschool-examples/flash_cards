require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  before do
    @card  = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn  = Turn.new("Juneau", @card)
    @card1 = Card.new("What planet is closet to the sun","Mercury", :STEM)
    @turn1 = Turn.new("Saturn", @card1)
  end

  it 'exists' do
    expect(@turn).to be_instance_of(Turn)
    expect(@turn1).to be_instance_of(Turn)
  end

  it 'has a card' do
    expect(@turn.card).to eq(@card)
     expect(@turn1.card).to eq(@card1)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq("Juneau")
    expect(@turn1.guess).to eq("Saturn")
  end

  it 'has correctness' do
    expect(@turn.correct?).to eq(true)
    expect(@turn1.correct?).to eq(false)
  end

  it 'has feedback' do
    expect(@turn.feedback).to eq("Correct!")
    expect(@turn1.feedback).to eq("Incorrect.")
  end
end
