require 'rspec'
require './lib/card'
require './lib/turn'


RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)

    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a turn' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)

    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)

    turn = Turn.new("Juneau", card)

    expect(card.answer).to eq("Juneau")
  end

  it 'has the correct answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)

    turn = Turn.new("Juneau", card)

    expect(card.answer).to eq("Juneau")
  end
end
