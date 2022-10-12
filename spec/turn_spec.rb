require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    describe '#initialize' do
        it 'exists' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new('Des Moines', card)

            expect(turn).to be_a Turn
        end

        it 'has a guess' do 
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new('Denver', card)

            expect(turn.guess).to eq 'Denver'
        end

        it 'has a card' do 
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new('Denver', card)
                
            expect(turn.card).to be_a Card
        end
    end
    
    describe '#correct?' do
    #unnecessary test, private method?
#I don't like that I'm sending another message to an object in this test.
        it 'can check the answer' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new('Juneau', card)
            expect(turn.correct?).to eq true
        end
    end

    describe '#feedback' do
        
        it 'can give user feedback on their answer' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            
            turn = Turn.new('Juneau', card)
            turn2 = Turn.new('Denver', card)

            expect(turn.feedback).to eq "Correct!"
            expect(turn2.feedback).to eq "Incorrect."
        end
    end
end





        

