require './lib/turn'

describe Turn do

it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(guess).to eq("Juneau")
end

it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to eq(:Geography)
end


end