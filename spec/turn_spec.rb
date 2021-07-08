require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'has a turn' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn).to be_a(Turn)
  end

  it 'has a guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn.card).to eq(card_1)
  end

  it 'determines if guess is correct' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau", card_1)

    expect(turn.guess).to eq(card_1.answer)
  end

  it 'determines if guess is incorrect' do
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card_2)

    expect(turn.guess).to eq("Saturn")
  end

  it 'has correct feedback' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    turn = Turn.new("Juneau", card_1)

    expect(turn.feedback).to eq("Correct!")
  end

  it 'has incorrect feedback' do
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card_2)

    turn.correct?

    expect(turn.feedback).to eq("Incorrect!")
  end
end
