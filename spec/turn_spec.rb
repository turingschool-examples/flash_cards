require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("guess", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'returns a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Denver", card)

    expect(turn.guess).to eq "Denver"
  end

  it 'returns a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Denver", card)

    expect(turn.card).to eq(card)
  end

  it 'returns if guess is correct or incorrect' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    incorrect_guess = Turn.new("Denver", card)
    correct_guess = Turn.new("Juneau", card)

    expect(incorrect_guess.correct?).to eq false
    expect(correct_guess.correct?).to eq true
  end

  it 'returns feedback based on guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    incorrect_guess = Turn.new("Denver", card)
    correct_guess = Turn.new("Juneau", card)

    expect(incorrect_guess.feedback).to eq "Incorrect."
    expect(correct_guess.feedback).to eq "Correct!"
  end
end