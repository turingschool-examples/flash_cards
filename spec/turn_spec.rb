require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", card)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)


    expect(turn).to be_instance_of(Turn)
    expect(card).to be_instance_of(Card)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has a card' do
    turn = Turn.new("Juneau", card)

    expect(turn.card.question).to eq("What is the capital of Alaska?")
    expect(turn.card.answer).to eq("Juneau")
    expect(turn.card.category).to eq(:Geography)
  end

  it 'has correct?' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to be true
  end

  it 'has feedback' do
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end

end
