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

   it 'returns appropriate feedback' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    # turn.correct?
    expect(turn.feedback).to eq("Correct!")
   end

#   it `returns the card?` do
#     turn = Turn.new("Juneau", :card)
#     expect(Card.new).to eq(card)
#   end

#   it 'returns true if correct' do
#     turn = Turn.new("Juneau", :card)
#     expect(turn.correct?).to be true
#   end



end