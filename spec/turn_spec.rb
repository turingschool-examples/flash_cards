require 'rspec'
require './lib/card'
require './lib/turn'


RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  it 'has correct feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card)
    turn_2 = Turn.new("Bob", card)

    expect(turn_1.feedback).to eq("Correct!")
    expect(turn_2.feedback).to eq("Incorrect.")
  end
end
