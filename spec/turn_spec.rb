require './lib/turn'
require './lib/card'

RSpec.describe Turn do
   it 'exists' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Juneau", card)

     expect(turn).to be_instance_of(Turn)
   end

   it 'has a guess' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Juneau", card)

     expect(turn.guess).to eq("Juneau")
   end

   it 'has a card' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Juneau", card)

     expect(turn.card).to be_instance_of(Card)
   end

   it 'evaluates the answer' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Juneau", card)

     expect(turn.correct?).to be(true)

     turn2 = Turn.new("Anchorage", card)

     expect(turn2.correct?).to be(false)
   end

   it 'provides feedback' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Juneau", card)

     expect(turn.feedback).to eq("Correct!")

     turn2 = Turn.new("Anchorage", card)

     expect(turn2.feedback).to eq("Incorrect.")
   end

 end
