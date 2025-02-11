require 'rspec'
require './lib/turn'
require './lib/card'

describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to be_instance_of(Card)
    end

    it 'has a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.guess).to eq("Juneau")
    end

    describe "#correct?" do 
        it 'returns true or false based on the answer' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.correct?).to eq(true) 
        end

        it 'gives feedback based on the answer' do
            card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
            turn = Turn.new("Juneau", card)

            expect(turn.feedback).to eq("Correct!")
        end

    end

    describe "incorrect guesses" do
        it 'has another card' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)

            expect(turn.card).to be_instance_of(Card)
        end

        it 'has a guess' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)
    
            expect(turn.guess).to eq("Saturn")
        end

   
        it 'returns true or false based on the answer' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)

            expect(turn.correct?).to eq(false) 
        end

        it 'gives feedback based on the answer' do
            card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
            turn = Turn.new("Saturn", card)

            expect(turn.feedback).to eq("Incorrect.")
        end
    end
    
end