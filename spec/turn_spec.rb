require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'is a turn' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)

    expect(turn.guess).to eq("Guess")
  end

  it 'returns the card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Guess", card)

    expect(turn.card).to eq(card)
  end

  it 'is correct?' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)


    # Need to test whether .correct? method returns true when guess equals answer
    expect(turn.correct?).to eq(true)
  end

  it 'gives feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end


end
