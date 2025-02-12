require './lib/card'
require './lib/turn'

RSpec.describe Turn do
    # This test is checking to see if card returns the question, answer and category of card
    # It's also
    it 'exists' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau",card)
  
      expect(turn).to be_instance_of(Turn)
    end
    it 'makes a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau",card)
    
        expect(turn.guess).to eq("Juneau")
    end
    it 'checks if the guess is correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau",card)
    
        expect(turn.correct?).to eq(true)
    end
    it 'checks for feedback' do
        card= Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau",card)

        expect(turn.feedback).to eq("Correct!")
    end
   
end    