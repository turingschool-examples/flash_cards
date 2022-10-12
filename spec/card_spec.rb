require './lib/card'

RSpec.describe Card do
  # card class exists and an instance can be made
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end
  # contains a question that can be accessed with :question
  it 'has a question' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.question).to eq("What is the capital of Alaska?")
  end
  # contains an answer that can be accessed with :answer
  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end
  # contains a category that can be accessed with :category
  it 'has a category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.category).to eq(:Geography)
  end
  # question, answer, and category are dynamic

  # any other edge cases?
end
