require './lib/card'


RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_a(Card)
  end

  it 'returns the expected question' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.question).to eq("What is the capital of Alaska?")
  end

  it 'returns the expected answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end

  it 'returns the expected category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.category).to eq(:Geography)
  end

end


