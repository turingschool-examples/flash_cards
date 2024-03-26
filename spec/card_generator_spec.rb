require 'spec_helper'

RSpec.describe CardGenerator do
    before(:each) do
        @card_generator = CardGenerator.new('./cards.txt')
    end

    describe '#initialize' do
        it 'exists' do
            expect(@card_generator).to be_instance_of(CardGenerator)
        end

        it 'has a txt file' do
            expect(@card_generator.txt_file).to eq('./cards.txt')
        end

        it 'starts with no cards' do
            expect(@card_generator.cards).to be_empty
        end
    end

    describe '#convert_lines_to_cards' do
        it 'can convert line in text file to new card instance' do
            @card_generator.convert_lines_to_cards            
            expect(@card_generator.cards[0]).to be_instance_of(Card)
        end
    end
end