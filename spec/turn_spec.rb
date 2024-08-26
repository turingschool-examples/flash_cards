# require 'pry';binding.pry
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
   
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
      
        expect(turn).to be_instance_of(Turn)
    end

    it 'has guess' do 
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography) 
        turn = Turn.new("Juneau", card)
        
        expect(turn.guess).to eq("Juneau")
    end

    
    it "has correct guess" do 
       
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
       
        expect(turn.correct?).to eq true
    end

    it "has wrong guess" do
        
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("florida", card)

        expect(turn.correct?).to eq false
    end

    it "good feedback" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("JUNeau", card)
       
        expect(turn.feedback).to eq "Correct"
    end

    it "bad feedback" do 
       
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("florida", card)

        expect(turn.feedback).to eq "Incorrect"
    end
   
end
     #expecting guess to be guess
     #expecting answer to be correct after typing in correct answer
     #2 seperate tests for correct and false