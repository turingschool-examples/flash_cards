require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn).to be_instance_of(Turn)
  end
end

RSpec.describe Turn do
  it 'it has guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.guess).to eq("Juneau")
  end
end

RSpec.describe Turn do
  it 'it has card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new('Juneau', card)
    expect(turn.card).to eq(card)
  end
end
