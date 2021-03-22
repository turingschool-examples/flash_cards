require './lib/card'
require './lib/turn'

RSpec.describe Turn do 
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'can read card' do 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end 

  it 'can read guess' do 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end 

  it 'can test if correct' do 
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end 

  it 'can return feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end 

  it 'can test incorrect guess' do 
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.card).to eq(card)
    expect(turn.guess).to eq("Saturn")
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect :(")
  end 
end 