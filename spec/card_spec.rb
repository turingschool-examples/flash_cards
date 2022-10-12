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
  
  it 'can handle different arguments' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    expect(card.question).to eq("Which planet is closest to the sun?")
    expect(card.answer).to eq("Mercury")
    expect(card.category).to eq(:STEM)
  end
end
