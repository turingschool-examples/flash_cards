require './lib/round'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    before :each do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new('Saturn', @card)
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

    it 'can return feedback if answer is correct/incorrect' do
        @turn1 = Turn.new("Juneau", @card)

        expect(@turn.feedback).to eq('Incorrect.')
        expect(@turn1.feedback).to eq('Correct!')
    end

    it 'can evaluate if the answers match but casing is off' do
        @turn1 = Turn.new("juneau", @card)
        
        expect(@turn1.correct?).to eq true
    end

end