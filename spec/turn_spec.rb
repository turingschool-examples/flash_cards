require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", card)

    expect(turn).to be_instance_of(Turn)
  end

end

