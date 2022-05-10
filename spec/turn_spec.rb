require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'Card exists' do
    card = Card.new("What is the capital of Oklahoma?", "Oklahoma City",
      :Geography)
    expect(card).to be_a Card
  end
end
