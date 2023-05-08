require './lib/card'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  it 'has a question' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.question).to eq("What is the capital of Alaska?")
  end

  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end

  it 'has a category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.category).to eq(:Geography)
  end
  
  it 'can have a different question, answer, and category' do
    card = Card.new("What country did boba tea originate?", "Taiwan", :food_geography)

    expect(card.question).to eq("What country did boba tea originate?")
    expect(card.answer).to eq("Taiwan")
    expect(card.category).to eq(:food_geography)
  end
end
