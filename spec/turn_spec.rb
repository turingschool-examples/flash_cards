require "./lib/turn.rb"
require "./lib/card.rb"


RSpec.describe Card do
    it 'exists' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        
        expect(card).to be_instance_of(Card)
    end     
end
RSpec.describe Turn do
    it "exists" do
        turn = Turn.new("Juneau", Card)

        expect(turn).to be_instance_of(Turn)

    end
    it "has a guess" do
        turn = Turn.new("Juneau", Card)

        expect(turn.guess).to eq("Juneau")
    end
    it "has boolien" do
        turn = Turn.new("Juneau", Card)

        expect(turn.correct?).to eq(true)
    end
    it "has feedback" do
        turn = Turn.new("Juneau", Card)

        expect(turn.feedback)
    end

end
   
         