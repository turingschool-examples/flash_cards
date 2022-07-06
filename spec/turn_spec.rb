require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a card' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn.card).to be_instance_of(Card)
  end

  it 'has a guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn.guess).to eq("Juneau")
  end

  it 'evaluates whether guess equals answer' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn.correct?).to eq(true)
  end

  it 'prints feedback based on guess' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)

    expect(turn.feedback).to eq("Correct!")
  end

end
