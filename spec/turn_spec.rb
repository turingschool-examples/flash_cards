require './lib/turn'
require './lib/card'

RSpec.describe Turn do
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@turn).to be_instance_of(Turn)
    end

   it 'makes card' do
     expect(@card.question).to eq("What is the capital of Alaska?")

     expect(@card.answer).to eq("Juneau")

     expect(@card.category).to eq(:Geography)
   end
 end

  describe 'turn arguments valid' do
   it 'reads user guess and card' do
     expect(@turn.user_guess).to eq('Juneau')

     expect(@turn.user_guess == 'JuNeAu').to be false

     expect(@turn.user_guess == "What is the capital of Alaska?").to be false

     expect(@turn.card_data).to eq(@card)
   end

    describe 'correct?' do
      it 'tests correctness correctly' do
        expect(@turn.correct?).to eq(true)
      end

      it 'tests incorrectness correctly' do
        turn = Turn.new("Albany", @card)

        expect(turn.correct?).to eq(false)
      end

      it "tests that capitalization doesn't matter" do # Wanted capitalization to not matter in user input.
        turn = Turn.new("JuNeAu", @card)

        expect(turn.correct?).to eq(true)
      end
   end

   describe 'feedback' do
     it 'verifies and tells if correct' do
       expect(@turn.feedback).to eq("Correct!")
     end

     it 'verifies and tells if incorrect' do
       turn = Turn.new("Albany", @card)

       expect(turn.feedback).to eq("Incorrect")
     end
   end
 end
end
