require './lib/turn'
require './lib/card'

RSpec.describe Turn do  
  it 'exists' do 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has attributes' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card)

    expect(turn.string).to eql("Anchorage")
    expect(turn.card).to eql(card)
  end

  it 'can guess answer' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card) 
    turn_2 = Turn.new("Juneau", card)

    expect(turn.guess).to eql("Anchorage")
    expect(turn.guess).not_to eql("Juneau")
  end
end