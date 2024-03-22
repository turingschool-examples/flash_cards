require 'spec_helper'
require 'pry'

RSpec.describe Turn do
    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn_1 = Turn.new("Juneau", @card_1)

        @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
        @turn_2 = Turn.new("Saturn", @card_2)
    end

    it 'exists' do
        expect(@turn_1).to be_instance_of(Turn)
    end

    it 'has a card' do  
        expect(@turn_1.card).to eq(@card_1)
        expect(@turn_2.card).to eq(@card_2)
    end

    it 'has a guess' do
        expect(@turn_1.guess).to eq("Juneau")
        expect(@turn_2.guess).to eq("Saturn")
    end

    describe '#correct?' do
        it 'returns boolean if guess matches answer on card' do
            expect(@turn_1.correct?).to be true
            expect(@turn_2.correct?).to be false
        end
    end

    describe '#feedback' do
        it 'returns correct or incorrect' do
            expect(@turn_1.feedback).to eq("Correct!")
            expect(@turn_2.feedback).to eq("Incorrect.")
        end
    end
end