# gather required files
require './lib/turn'
require './lib/card'

# test the Turn class
describe Turn do
  # Check initialize class
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn).to be_instance_of(Turn)
  end

  # check get guess methods
  it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.guess).to eq("Juneau")
  end

  # check get card method
  it 'has a card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.card).to eq(card)
  end

  # test correct? method
  it 'correct? returns true' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.correct).to eq(true)
  end
  it 'correct? returns false' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Harrisburgh", card)
    expect(turn.correct).to eq(false)
  end

  # test feedback method
  it 'feedback returns "Correct!"' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
  end
  it 'feedback returns "Incorrect."' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Harrisburgh", card)
    expect(turn.feedback).to eq("Incorrect.")
  end
end
