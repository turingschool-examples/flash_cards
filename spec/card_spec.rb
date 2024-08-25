require './lib/card'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end

  it 'has a question, answer, and category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card.question).to eq("What is the capital of Alaska?")
    expect(card.answer).to eq("Juneau")
    expect(card.category).to eq(:Geography)
  end
end
