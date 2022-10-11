require './lib/card'
require './lib/turn'

RSpec.describe Turn do 
    before (:each) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Juneau", @card)
    end

    describe "#initialize" do
        it 'exists and has readable attributes' do
            expect(@turn).to be_an_instance_of(Turn)
            expect(@turn.card).to eq(@card)
            expect(@turn.guess).to eq("Juneau")
        end
    end

    describe '#correct?' do
        it 'can return a boolean for the answer' do
            expect(@turn.correct?).to eq(true)
            expect(@turn.feedback).to eq("Correct!")
        end
    end
end