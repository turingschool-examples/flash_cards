require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
  turn = Turn.new("Juneau", card)

  it 'exists' do
    expect(turn).to be_instance_of(Turn)
  end

  it 'has an associated card' do
    expect(turn.card).to eq(card)
  end

  it 'has a guess' do
    expect(turn.guess).to eq("Juneau")
  end

  it 'has correct? method (true)' do
    expect(turn.correct?).to be(true)
  end

  it 'has feedback method (true)' do
    expect(turn.feedback).to eq("Correct!")
  end

  it 'has correct? method (false)' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.correct?).to be(false)
  end

  it 'has feedback method (false)' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
