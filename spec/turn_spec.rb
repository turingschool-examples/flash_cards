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
        it 'can check the answer' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new('Juneau', card)
            turn2 = Turn.new('Denver', card)

            expect(turn2.correct?).to eq false
            expect(turn.correct?).to eq true
        end
    end

    describe '#close_enough?' do
        it 'checks whether or not the guess has similar characters to answer' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new('Junea', card)
            turn2 = Turn.new('Denver', card)

            expect(turn.close_enough?).to eq true
            expect(turn2.close_enough?).to eq false 
        end
    end

    describe '#feedback' do        
        it 'can give user feedback on their answer' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            
            turn = Turn.new('Juneau', card)
            turn2 = Turn.new('Denver', card)

            expect(turn.feedback).to eq "Correct!\n"
            expect(turn2.feedback).to eq "Incorrect.\n"
        end
    end
end





        

