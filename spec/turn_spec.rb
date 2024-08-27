require './lib/turn'
require './lib/card'

Respec.describe Turn do
    it 'describes turn class' do
        turn = Turn.new("Saturn", card)
        
        expect(turn).to be_instance_of(Turn)
    end

    it 'has an answer' do
        turn = Turn.new("Saturn", card)

        expect(turn.answer).to eq("Mercury")
    end

    it 'has a question' do
        turn = Turn.new("Saturn", card)

        expect(turn.question).to eq("Which planest is closest to the sun?")
    end

    it 'has a catagory' do
        turn = Turn.new("Saturn", card)

        expect(turn.catagory).to eq(:STEM)
    end

    it 'gives feedback' do
        turn = Turn.new("Saturn", card)

        expect(@guess.correct).to be false
    end
end