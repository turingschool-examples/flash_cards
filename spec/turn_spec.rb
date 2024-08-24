
require './lib/turn'
require './lib/card'
 
RSpec.describe Turn do
    it 'exists' do
        turn = Turn.new("Juneau", Card)
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(turn).to be_instance_of(Turn)
    end

    it 'has guess' do 
        turn = Turn.new("Juneau", Card)
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(turn.guess).to eq("Juneau")
    end

    
    it "has correct guess" do 
        turn = Turn.new("Juneau", Card)
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(turn.correct?).to eq true
    end

    xit "has wrong guess" do
        turn = Turn.new("florida", Card)
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(guess.correct?).to eq false
    end

    xit "good feedback" do
        turn = Turn.new("juneau", Card)
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

        expect(guess.feedback).to eq "correct"
    end

   
end
     #expecting guess to be guess
     #expecting answer to be correct after typing in correct answer
     #2 seperate tests for correct and false