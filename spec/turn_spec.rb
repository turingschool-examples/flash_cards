require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", card)
    expect(turn.guess).to eq("Janeau")
  end

  xit 'has a correct guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Janeau", card)
    expect(turn.correct?).to eq(true)
  end

  it "has an incorrect guess" do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Anchorage", card) 

    expect(turn.correct?).to eq(false)
  end

end

