require './lib/turn'
require './lib/card'

RSpec.describe Turn do

  it 'can return card, guess and evauate guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card

    expect(turn.guess).to eq("Juneau")

    expect(turn.correct?).to eq(true)
  end

  it 'can give feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end

  it 'can recognise false guesses and return feedback' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    turn.card

    expect(turn.guess).to eq("Saturn")
    expect(turn.correct?).to eq(false)
    expect(turn.feedback).to eq("Incorrect.")
  end

end
