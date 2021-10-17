require './lib/turn'
require './lib/card'

RSpec.describe Turn do
 it 'exists' do
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   expect(turn).to be_instance_of(Hearts)
 end

 it 'makes card' do
   card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
   turn = Turn.new("Juneau", card)

   expect(card.question).to eq("What is the capital of Alaska?")

   expect(card.answer).to eq("Juneau")

   expect(card.category).to eq(:Geography)
 end

  describe 'turn arguments valid' do
   it 'reads user guess and card' do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Juneau", card)

     expect(turn.user_guess).to eq('Juneau')

     expect(turn.card_data).to eq(card)

     # expect(turn.card).to eq(card) # Same as above, just testing continuity of variable names
   end

    describe 'correct?' do
      it 'tests correctness correctly' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq(true)
      end

      it "tests that capitalization doesn't matter" do # Wanted capitalization to not matter in user input.
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("JuNeAu", card)

        expect(turn.correct?).to eq(true)
      end

     it 'tests correctness correctly' do
       card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       turn = Turn.new("Albany", card)

       expect(turn.correct?).to eq(false)
     end
   end

   describe 'feedback' do
     it 'tests correct answer' do
       card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       turn = Turn.new("Juneau", card)

       expect(turn.feedback).to eq("Correct!")
     end

     it 'tests incorrect answer' do

       card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       turn = Turn.new("Albany", card)

       expect(turn.feedback).to eq("Incorrect")
     end
   end
 end
end
