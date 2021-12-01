require './lib/turn'
require './lib/card'
require 'rspec'
require 'pry'

RSpec.describe Turn do
  it 'exists' do
    my_card = Card.new("What is the capital of Alaska", "Juneau", :Geography)
    my_turn = Turn.new("What is the capital of Alaska?", my_card)
    expect(my_turn).to be_instance_of(Turn)
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
  it 'can turn a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card.category).to eq(:Geography)
  end

end
