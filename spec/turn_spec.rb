require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Is it guess?", card)
    expect(turn).to be_instance_of(Turn)
   end

   it 'returns true if guess equal answer' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card_1)
    expect(turn.correct?).to be true
   end

   it 'returns false if guess != equal answer' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Texas", card_1)
    expect(turn.correct?).to be false
   end

   it 'returns appropriate feedback for true' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    expect(turn.feedback).to eq("Correct!")
   end

   it 'returns appropriate feedback for false' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Texas", card)
    expect(turn.feedback).to eq("Incorrect.")
   end
end