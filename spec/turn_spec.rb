require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    before :each do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @Turn.new("Saturn", @card)
    end

    it 'exists' do
        expect(@turn).to be_a(Turn)
    end

    it 'has attributes' do
        expect(@turn.guess).to eq('Saturn')
        expect(@turn.card).to eq(@card)
    end

    it 'can evaluate if the guess is correct' do
        expect(@turn.correct?).to eq false
    end

end