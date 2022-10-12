require 'rspec'
require './lib/turn'
require './lib/card'

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

        it 'has a guess' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.guess).to eq("Juneau")
        end
    end
    describe 'correct?' do
        it 'does guess match answer' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.correct?).to be true
        end
    end
    
    describe 'feedback' do
        it 'does feedback reflect correct?' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)
            
            expect(turn.feedback).to eq("Correct!")
        end
    end
end