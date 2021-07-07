require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  it 'initializes a card' do
    expect(card).to be_instance_of(Card)
  end

  it 'exists' do
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn.guess

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    turn.card

    expect(turn).to be_instance_of(Turn)
  end

  it 'is correct' do
    turn.correct?

    expect(turn.correct?).to be true
  end

  it 'has feedback' do
    turn.correct?
    turn.feedback

    expect(turn.feedback).to eq("Correct!")
  end

  it 'is incorrect' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    turn.correct?

    expect(turn.correct?).to be false
  end

  it 'has feedback on incorrect' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    turn.correct?
    turn.feedback

    expect(turn.feedback).to eq("Incorrect.")
  end
end
