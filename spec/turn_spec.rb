require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    
        expect(card).to be_instance_of(Card)
    end

    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
  
      expect(turn).to be_instance_of(Turn)
    end

    it "returns card info" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

       expect(turn.card).to eq(card)
    end

    it "states the guess" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

       expect(turn.guess).to eq("Juneau")
    end

    it "checks if guess is correct" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

       expect(turn.correct?).to eq(true)
    end

    it "states if guess is correct" do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

       expect(turn.feedback).to eq("Correct!")
    end
end