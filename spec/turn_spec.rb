require './lib/turn'
require './lib/card'
require 'rspec'

RSpec.describe Turn do
  
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'it has guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  it 'it has the card object' do
    expect(@turn.card).to be_instance_of(Card)
  end

end