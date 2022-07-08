require './lib/turn'
require './lib/card'

RSpec.describe Turn do

    before :each do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Saturn", @card)
    end
    
    it 'exists' do

        expect(@turn).to be_instance_of(Turn)
    end

    it 'returngs a card' do

        expect(@turn.card).to eq(@card)
    end

    it 'returns a guess' do

        expect(@turn.guess).to eq("Saturn")
    end

    it 'is_guess_correct?' do

        expect(@turn.correct?).to eq(false)
    end

    it 'gives_feedback' do

        expect(@turn.feedback).to eq("Incorrect.")
    end
end
