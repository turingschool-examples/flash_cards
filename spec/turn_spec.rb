require './lib/turn.rb'
require './lib/card.rb'

RSpec.describe Turn do
  it 'exists' do
    myCard = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess",myCard)
    expect(turn).to be_instance_of(Turn)
  end

end