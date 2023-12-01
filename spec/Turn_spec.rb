require './lib/Turn'
require './lib/card'

RSpec.describe Turn do
    before (:each) do @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    end
    it 'exists' do
        turn = Turn.new("Juneau", @card)
        expect(turn).to be_instance_of(Turn)
    
    end

    it 'is correct?' do
        turn = Turn.new("Juneau", @card)
        expect(turn.correct?).to eq true
    end

    it "is a card" do
        turn = Turn.new("Juneau", @card)
        expect(turn.card).to be_instance_of(Card)
    end

    it "takes a guess" do
        turn = Turn.new("Juneau", @card)
       expect(turn.guess).to eq("Juneau") #confused as to why @guess isnt working
    end
    
    it "provides feedback" do
        turn = Turn.new("Juneau", @card)
        expect(turn.feedback).to eq ("Correct!")
    end
end

