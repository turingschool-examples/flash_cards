require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
  it 'card exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(card).to be_instance_of(Card)
  end

  it 'turn exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

  it 'card can be called' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.card).to eq(card)
  end

  it 'guess can be called' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.guess
    expect(turn.guess).to eq('Juneau')
  end

  it 'can determine if the guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn.correct?
    expect(turn.correct?).to eq true
  end

  it 'can respond depending on the answer' do
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

  it 'can handle incorrect guesses and return the right message' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    turn.feedback
    expect(turn.feedback).to eq('Incorrect.')
  end

end
