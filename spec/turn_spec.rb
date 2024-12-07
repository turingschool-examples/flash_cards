require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    before(:each) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Juneau", @card)
    end

    it 'exists' do
        expect(@turn).to be_instance_of(Turn)
    end

    it 'has a guess' do
        expect(@turn.guess).to eq("Juneau")
    end

    it 'has a card' do
        expect(@turn.card).to eq(@card)
    end

    it 'can check if the guess is correct' do
        expect(@turn.correct?).to be true
    end

    it 'gives feedback' do
        expect(@turn.feedback).to eq("Correct!")
    end

    context 'when the guess is incorrect' do
        before(:each) do
            @turn = Turn.new("Anchorage", @card)
        end

        it 'can check if the guess is incorrect' do
            expect(@turn.correct?).to be false
        end

        it 'gives feedback' do
            expect(@turn.feedback).to eq("Incorrect.")
        end
    end
end