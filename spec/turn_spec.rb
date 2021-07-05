require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    @turn1 = Turn.new("Juneau", @card1)
    @turn2 = Turn.new("Saturn", @card2)
  end

  it 'exists' do
    expect(@turn1).to be_a(Turn)
  end

  it 'has a card as a card object' do
    expect(@turn1.card).to eq(@card1)
  end

  it 'has a guess' do
    expect(@turn1.guess).to eq("Juneau")
  end
end
