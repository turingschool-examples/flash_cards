require 'rspec'
require './lib/card'

describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  it 'contains a question string' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.question).to eq("What is the capital of Alaska?")
  end

  it 'contains an answer string' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end

  it 'contains a category symbol' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.category).to eq(:Geography)
  end
end
