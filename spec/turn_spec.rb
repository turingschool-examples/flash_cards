require './lib/turn.rb'
require './lib/card.rb'
require 'pry'
require 'rspec'

describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end
end

describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'returns values of card instance' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to eq("What is the capital of Alaska?", "Juneau", :Geography)
  end

  it 'returns the value of Guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess)to eq("Juneau")
  end

  it 'compares answer to guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?)to be true
  end

  it 'returns proper feedback when question answered correctly' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    if @guess == @answer
      expect(turn.feedback)to eq("Correct!")
    else
      expect(turn.feedback)to eq("Incorrect.")
  end


end
