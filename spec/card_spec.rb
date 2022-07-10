require './lib/card'
require 'rspec'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_a(Card)
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
end


##Setting up test above- 1 describe block with multiple "it" statements
#focus on .to be_instance_of and .to eq when setting up tests for project
#don't put variables outside of the it block
