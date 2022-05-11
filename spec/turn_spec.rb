require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
  it 'card is an instance of Card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end

  it 'turn is an instance of Turn and accepts card as an argument' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'you can access card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.card).to eq(card)
  end

  it 'you can access guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.guess
    expect(turn.guess).to eq('Juneau')
  end

  it 'determine if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.correct?
    expect(turn.correct?).to eq true
  end

  it 'respond appropriately to a correct answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.feedback
    expect(turn.feedback).to eq('Correct!')
  end

  it 'can handle incorrect guesses' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    turn.correct?
    expect(turn.correct?).to eq false
  end

  it 'can handle incorrect guesses and return the correct message' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    turn.feedback
    expect(turn.feedback).to eq('Incorrect.')
  end

end
