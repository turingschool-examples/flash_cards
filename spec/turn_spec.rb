require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
  before :each do
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn1 = Turn.new("Juneau", @card1)
    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn2 = Turn.new("Saturn", @card2)
  end
  it 'exists' do
    expect(@turn1).to be_instance_of(Turn)
    expect(@turn1.card).to eq(@card1)
    expect(@turn1.guess).to eq("Juneau")
  end

  it 'checks to see if the answer is correct' do
    expect(@turn1.correct?).to be(true)
    expect(@turn2.correct?).to be(false)
  end

  it 'gives feedback' do
    expect(@turn1.feedback).to eq("Correct!")
    expect(@turn2.feedback).to eq("Incorrect.")
  end
end