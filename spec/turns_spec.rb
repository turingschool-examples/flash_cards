require './lib/card'
require './lib/turns'


describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end
end

describe Turns do
  it 'exists' do
    turns = Turns.new("Juneau", @card)

    expect(turns).to be_instance_of(Turns)
  end
end

describe Turns do
  it 'is correct' do
    turns = Turns.new("Juneau", @card)
    expect(turns.correct?).to eq(true)

  end
end

describe Turns do
  it 'has feedback' do
    turns = Turns.new("Juneau", @card)
    expect(turns.feedback).to eq("Correct!")
  end
end
