require './lib/card'
require './lib/turn'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Juneau", Card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", Card)
    expect(turn.guess). to eq "Juneau"
  end

  it 'is correct?' do
    card = Card.new("What is the capital of Alaska", "Juneau", :geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq true
  end

  it 'is correct?' do
    card = Card.new("What is the capital of Alaska", "Juneau", :geography)
    turn = Turn.new("Juneau", card)

    expect(turn.feedback).to eq "Correct!"
  end 


end
