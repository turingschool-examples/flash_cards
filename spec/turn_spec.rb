require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  it 'exists' do
    turn = Turn.new("Is it guess?", :card)
    expect(turn).to be_instance_of(Turn)
   end

   it 'returns true if guess equal answer' do
    turn = Turn.new("Juneau?", :card)
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    expect(turn.correct?("Juneau?")).to be true
   end

   xit 'returns appropriate feedback' do
    turn = Turn.new("Juneau?", :card)
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