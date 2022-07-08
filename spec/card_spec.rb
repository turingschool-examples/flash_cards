require './lib/card'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  it 'has a question' do
    card = Card.new("true or false? 5 < 5", false, :Math)

    expect(card.question).to eq("true or false? 5 < 5")
  end

  it 'has an answer' do
    card = Card.new("What is 5 + 5", 10, :Math)

    expect(card.answer).to eq(10)
  end

  it 'has a category' do
    card = Card.new("What is the capital of Louisiana?", "Baton Rouge", :Geography)

    expect(card.category).to eq(:Geography)
  end
end
