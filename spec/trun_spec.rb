require './lib/turn'
require './lib/card'
require 'rspec'

RSpec.describe Turn do
  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end

  it "has a turn" do
    turn = Turn.new("Juneau", @card)
    expect(turn.guess).to eq("Juneau")
  end

  it 'turn card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.card).to eq(card)
  end

  it 'turn card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct?).to eq(true)
  end



end
