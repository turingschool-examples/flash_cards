require 'spec_helper'

RSpec.describe Turn do
    before(:each) do
        @card_1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
        @turn_1 = Turn.new('Juneau', @card_1)
        @card_2 = Card.new('Which planet is closest to the sun?', 'Mercury', :STEM)
        @turn_2 = Turn.new('Saturn', @card_2)
    end

    describe '#initialize' do
        it 'exists' do
            expect(@turn_1).to be_instance_of(Turn)
        end

        it 'turn_1 instance has a card object' do  
            expect(@turn_1.card).to eq(@card_1)
        end

        it 'turn_2 instance has a card object' do
            expect(@turn_2.card).to eq(@card_2)
        end

        it 'turn_1 instance has a guess' do
            expect(@turn_1.guess).to eq('Juneau')
        end

        it 'turn_2 instance has a guess' do
            expect(@turn_2.guess).to eq('Saturn')
        end
    end

    describe '#correct?' do
        it 'returns true if guess matches answer on card' do
            expect(@turn_1.correct?).to be true
        end

        it 'returns false if guess does not match answer on card' do
            expect(@turn_2.correct?).to be false
        end
    end

    describe '#feedback' do
        it 'returns correct if guess was right' do
            expect(@turn_1.feedback).to eq('Correct!')
        end

        it 'returns incorrect if guess was wrong' do
            expect(@turn_2.feedback).to eq('Incorrect.')
        end
    end
end