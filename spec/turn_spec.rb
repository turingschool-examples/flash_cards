require './lib/card'
require './lib/turn'

RSpec.describe Turn do

    before(:each) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    end

    it 'exists' do
        turn = Turn.new("Juneau", @card)

        expect(turn).to be_instance_of(Turn)
    end

    it 'is Juneau by default' do
        turn = Turn.new("Juneau", @card)

        expect(turn.guess).to eq("Juneau")
    end

    it "does not have to be Juneau" do
        turn = Turn.new("Spain", @card)

        expect(turn.guess).to eq("Spain")
    end

    it 'returns the Card' do
        turn = Turn.new("Juneau", @card)

        expect(turn.card).to eq(@card)
    end
    
    it 'indicates if the guess matched the answer on the card' do
        turn = Turn.new("Juneau", @card)

        expect(turn.correct?).to eq(true)
    end

    it 'provides feedback' do
        turn = Turn.new("Juneau", @card)

        expect(turn.feedback).to eq("Correct!")
    end

end
