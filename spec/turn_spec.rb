require 'pry'
require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  it 'exists' do
    expect(@turn).to be_a(Turn)
  end

  it 'can have a card' do
    expect(@turn.card).to be_instance_of(Card)
  end

  it 'has a guess' do
    expect(@turn.guess).to eq("Juneau")
  end

  it 'was guessed correctly' do
    expect(@turn.correct?).to eq(true)
  end
  # binding.pry
end
