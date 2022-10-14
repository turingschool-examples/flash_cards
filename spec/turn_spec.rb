require 'rspec'
require './lib/turn'
require './lib/card'
#test turn exists
describe Turn do 
    describe '#initialize' do 
        it 'is an instance of turn' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)
        
        expect(turn).to be_instance_of(Turn)
        end

        it 'has a card' do 
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
        end 
    describe 'correct?'
        it 'will see if the answer is correct' do 
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)
            
        expect(turn.correct?).to be true
        end 
    describe 'feedback'
        it 'will tell you if it is correct or not' do 
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

        expect(turn.feedback).to eq(turn.correct?)
        end 
    end 

    
end 
    
      

   
    

#test it has a guess
#test if it has the correct answer or not
#test if it gives feed back
