require './lib/card'
require './lib/turn'
require './lib/deck'


RSpec.describe Deck do
  it 'exists' do
    deck = Deck.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(deck).to be_instance_of(Deck)
  end

  it 'has a question' do
    deck = Deck.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(deck.question).to eq("What is the capital of Alaska?")
  end

  it 'has an answer' do
    deck = Deck.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(deck.answer).to eq("Juneau")
  end

  it 'has a category' do
    deck = Deck.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(deck.category).to eq(:Geography)
  end
end
