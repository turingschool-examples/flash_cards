require 'pry'
require './lib/card'

RSpec.describe Card do
  let (:card_1) {Card.new("What is the capital of Alaska?", "Juneau", :Geography)}
    
  it 'exists' do
    expect(card_1).to be_instance_of(Card)
  end

  it 'has a question' do
    expect(card_1.question).to eq("What is the capital of Alaska?")
  end

  it 'has an answer' do
    expect(card_1.answer).to eq("Juneau")
  end

  it 'has a category' do
    expect(card_1.category).to eq(:Geography)
  end
end
