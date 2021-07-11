require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", Card)

    expect(turn).to be_a(Turn)
  end

  it 'has a card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn.card).to eq(card_1)
  end

  it 'has a guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", Card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a correct? guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", Card)

    expect(turn.guess).to eq(card_1.answer)
  end

  it 'has feedback' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    turn.correct?

    expect(turn.feedback).to eq("Correct")
  end

  it 'incorrect answer' do
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card_2)

    expect(turn.card).to eq(card_2)
    expect(turn.guess).to eq("Saturn")
    expect(turn.correct?).to eq(false)
  end 

  it 'has incorrect feedback' do
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card_2)

    expect(turn.card).to eq(card_2)
    expect(turn.guess).to eq("Saturn")
    expect(turn.feedback).to eq("Incorrect")
  end
end
