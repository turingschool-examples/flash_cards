require './lib/card.rb'
require './lib/turn.rb'

RSpec.describe Turn do
  card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

  it 'exists' do
    turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end


  it 'has a card' do
    turn = Turn.new("Juneau", card)

    expect(turn.card).to be_instance_of(Card)
  end


  it 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to be_a(String)
  end


  it 'identifies correct' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq(true)
  end


  it 'identifies incorrect' do
    turn_wrong = Turn.new("Anchorage", card)

    expect(turn_wrong.correct?).to eq(false)
  end
  

  it 'returns correct feedback' do
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")


    turn_wrong = Turn.new("Anchorage", card)

    expect(turn_wrong.feedback).to eq("Incorrect.")
  end

end
