require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
    before(:each) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Juneau", @card)
    end

    it "exists" do
        expect(@turn).to be_instance_of(Turn)
    end

    it "has a card" do  
        expect(@turn.card).to eq(@card)
    end

    it "has a guess" do
        expect(@turn.guess).to eq("Juneau")
    end

    describe "#correct?" do
        it "returns boolean if guess matches answer on card" do
            expect(@turn.correct?).to be true
        end
    end

    describe "#feedback" do
        it "returns correct or incorrect" do
            expect(@turn.feedback).to eq("Correct!")
        end
    end
end