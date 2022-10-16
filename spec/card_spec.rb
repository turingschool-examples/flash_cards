require './lib/card'

RSpec.describe Card do


#Test 1
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography, 1)

    expect(card).to be_instance_of(Card)
  end

#Test 2
  it 'has a question' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography, 1)

    expect(card.question).to eq("What is the capital of Alaska?")
  end

#Test 3
  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography, 1)

    expect(card.answer).to eq("Juneau")
  end

#Test 4  
  it 'has a category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography, 1)

    expect(card.category).to eq(:Geography)
  end
end
