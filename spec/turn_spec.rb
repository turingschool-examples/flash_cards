require './lib/turn'
require './lib/card'
require 'rspec'

describe Turn do
  it 'creates card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   
    expect(card).to be_instance_of(Card)
  end

  it 'creates turn' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to be_instance_of(Card)
  end

  it 'has guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    expect(turn.guess).to eq("Juneau")
  end

  it 'has condition for guess correctness' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    expect([true, false]).to include(turn.correct?)
  end

  it 'has message response regarding correctness' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    expect(turn.feedback).to be_instance_of(String)
  end

  it 'handles incorrect guesses' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.guess).to eq("Saturn")
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect.")
  end

  it 'can process partial answers' do
    card = Card.new("Best movie of all time?", "Who Framed Roger Rabbit?", "Pop Culture")
    turn = Turn.new("Framed Roger Rabbit", card)

    expect(turn.guess).to eq("Framed Roger Rabbit")
    expect(turn.correct?).to eq(true)
    expect(turn.feedback).to eq("Correct!")
  end
end