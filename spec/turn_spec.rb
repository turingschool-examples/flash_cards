require "./lib/turn"
require "./lib/card"

RSpec.describe Turn do
 it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.new).to be_instance_of(Turn)
 end

 it 'has a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to be("Juneau")
 end

 it 'checks if guess is correct' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
#not sure if this is correct to check "if correct"
#needs work
    expect(turn.correct?).to be true
 end

 it 'checks if guess is incorrect' do
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    turn.guess
#not sure if this is correct to check "if correct"
#needs work
    expect(turn.correct?).to be false
 end

 it 'gives feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Juneau", card)
    turn = Turn.new("Saturn", card)
#likely need revision
    expect(turn.feedback).to eq("Correct!"))
    expect(turn.feedback).to eq("Incorrect.")
 end

end