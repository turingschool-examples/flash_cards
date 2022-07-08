'./lib/turn'
'./lib/card'

RSpec.describe Turn do
  it 'exists' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Juneau", card)

     expect(card).to be_instance_of(Card)
     expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq("Juneau")
  end

  it 'has correct?' do
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq true
  end

  it 'has feedback' do
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq("Correct!")
  end   

end
