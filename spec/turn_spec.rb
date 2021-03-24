require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card1)
    expect(turn).to be_instance_of(Turn)
  end

  it 'has attributes' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card1)

    expect(turn.guess).to eq("Juneau")
    expect(turn.card).to eq(card1)
  end

  it 'show incorrect guess' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.guess).to eq("Saturn")
  end

  it 'check if correct' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card1)
    expect(turn.correct?).to be true
  end

  it 'check if incorrect' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.correct?).to be false
  end

  it 'gives correct feedback' do
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card1)

    expect(turn.feedback).to eq("Correct!")
  end


  it 'give incorrect feedback' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    expect(turn.feedback).to eq("Incorrect.")
  end
end
