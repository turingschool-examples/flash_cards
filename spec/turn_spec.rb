require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)

    expect(turn_1).to be_instance_of(Turn)
  end

  it 'returns the guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)

    expect(turn_1.guess). to eq("Juneau")
  end 

  it 'returns the card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)

    expect(turn_1.card). to eq(card_1)
  end

  it 'returns true when answer is correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)

    expect(turn_1.correct?).to be true 
  end

  it 'provides feedback' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn_1 = Turn.new("Juneau", card_1)

    expect(turn_1.feedback). to eq("Correct!")
  end 
end

