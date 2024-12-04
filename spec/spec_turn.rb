require './lib/turn.rb'
require './lib/card.rb'

RSpec.describe Turn do
    it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Boston",card)

    expect(turn).to be_instance_of(Turn)
    end
    it 'has a guess' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Boston",card)

     expect(turn.guess).to eq("Boston")
    end
end