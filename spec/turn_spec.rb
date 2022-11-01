require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'contains a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'contains the correct card card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card.question).to eq("What is the capital of Alaska?")
    expect(turn.card.answer).to eq("Juneau")
    expect(turn.card.category).to eq(:Geography)
  end

  it 'contains a correct? method that returns true or false if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    wrong_turn = Turn.new("Washington DC", card)

    expect(turn.correct?).to eq(true)
    expect(wrong_turn.correct?).to eq(false)
  end

  it 'contains a feedback method that returns a string based on the correct or incorrect answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    wrong_turn = Turn.new("Washington DC", card)

    expect(turn.feedback).to eq('Correct!')
    expect(wrong_turn.feedback).to eq('Incorrect.')
  end

end
