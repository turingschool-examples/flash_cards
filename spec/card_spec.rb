require 'rspec'
require './lib/card'

RSpec.describe Card do
#check that the Class is correct
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end
#check that we can read the question attribute
  it 'has a question' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card.question).to eq("What is the capital of Alaska?")
  end
#check that we can read the answer attribute
  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card.answer).to eq("Juneau")
  end
#check that we can read the category attribute
  it 'has a category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card.category).to eq(:Geography)
  end
end
