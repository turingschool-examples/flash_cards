require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  it 'exists' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a string' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",card)

    expect(turn.string).to eq("Juneau")
  end

  it 'has a card' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",card)

    expect(turn.card).to eq(card)
  end

  describe ('#correct?')

  it 'is correct' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",card)
    turn_2 = Turn.new("Jerry",card)

    expect(turn.correct?).to eq(true)
    expect(turn_2.correct?).to eq(false)

  end

  describe ('#feedback')

  it 'has feedback' do

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau",card)

    expect(turn.feedback).to eq("Correct!")
  end
end
