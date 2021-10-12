require './lib/turn'
require './lib/card'


RSpec.describe Turn do
  it 'exists' do
    turn  = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))
    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))
    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    turn = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))
    expect(turn.card).to be_instance_of(Card)
  end

  it 'has a correct? answer' do
    turn  = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))
    expect(turn.correct?).to eq(true)
  end

  it 'has feedback' do
    turn  = Turn.new("Juneau", Card.new("What is the capital of Alaska?", "Juneau", :Geography))
    expect(turn.correct?).to eq(true)
    expect(turn.feedback).to eq("Correct!")
  end
end
