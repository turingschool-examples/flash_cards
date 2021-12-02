require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has card info'  do
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq(card)
  end

  it 'has  diffrent card info'  do
    card = Card.new("Which planet is the closest to the sun", "Mercury", :Stem)
    turn = Turn.new("Saturn", card)

    expect(turn.card).to eq(card)
  end

  it 'has guess info' do
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has diffrent guess info' do
    card = Card.new("Which planet is the closest to the sun", "Mercury", :Stem)
    turn = Turn.new("Saturn", card)

    expect(turn.guess).to eq("Saturn")
  end

  it 'returns true when guess is correct' do
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq true
  end

  it 'returns false when guess is false' do
    card = Card.new("Which planet is the closest to the sun", "Mercury", :Stem)
    turn = Turn.new("Saturn", card)

    expect(turn.correct?).to eq false
  end

  it 'returns correct' do
    card = Card.new("What is the Capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feeback).to eq("Correct!")
  end

  it 'returns incorrect' do
    card = Card.new("Which planet is the closest to the sun", "Mercury", :Stem)
    turn = Turn.new("Saturn", card)

    expect(turn.feeback).to eq("Incorrect!")
  end

end
