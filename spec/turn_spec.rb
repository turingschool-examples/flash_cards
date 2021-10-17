require './lib/turn'

RSpec.describe Turn do
 it 'exists' do
   turn = Turn.new("something", "something2")
   expect(turn).to be_instance_of(Turn)
 end

 it 'has a guess' do
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   expect(turn.guess).to eq("Juneau")
 end

 it 'is correct?' do
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   expect(turn.correct?).to eq(true)
 end

 it 'has positive feedback' do
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   expect(turn.feedback).to eq("Correct!")
 end

   it 'has incorrect feedback' do
     card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
     turn = Turn.new("Saturn", card)

     expect(turn.feedback).to eq("Incorrect.")
   end

   it 'is false?' do
     card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
     turn = Turn.new("Saturn", card)

     expect(turn.correct?).to eq(false)
   end
 end
