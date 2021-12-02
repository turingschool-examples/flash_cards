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
  # binding.pry
end
