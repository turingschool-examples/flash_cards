require './lib/card'
require './lib/turn'

RSpec.describe do

  before(:each) do
    card = Card.new("What is the capital of Alaska?","Juneau", :Geography)
    turn = Turn.new("Juneau", card)
  end
 
  it 'exist' do
    turn = Turn.new("Juneau", card)
    expect(@turn).to be_instance_of(Turn)
 end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.guess).to eq("Juneau")

    turn = Turn.new("Saturn", card)
    turn.card
    expect(turn.guess).to eq("Saturn")
  end

  it 'can check if guess is correct?' do
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.correct?).to eq(true)

    turn = Turn.new("Saturn", card)
    turn.card
    expect(turn.correct?).to eq(false)

  end

  it 'gives feedback' do
    turn = Turn.new("Juneau", card)
    turn.card
    expect(turn.feedback).to eq("Correct!")

    turn = Turn.new("Saturn", card)
    turn.card
    expect(turn.feedback).to eq("Incorrect")

  end

end