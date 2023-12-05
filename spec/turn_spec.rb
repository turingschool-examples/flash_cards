require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    
        expect(card).to be_instance_of(Card)
    end

    before(:example) do #code block to run before all remaining tests below
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Juneau", @card)
    end

    it 'exists' do
        expect(@turn).to be_instance_of(Turn)
    end

    it "returns card info" do
        expect(@turn.card).to eq(@card)
    end

    it "states the guess" do
        expect(@turn.guess).to eq("Juneau")
    end

    it "checks if guess is correct" do
        expect(@turn.correct?).to eq(true)
    end

    it "states if guess is correct" do
        expect(@turn.feedback).to eq("Correct!")
    end
end