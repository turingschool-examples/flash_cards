require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/card_generator.rb'

RSpec.describe Round do
    before :each do
        @file = 'cards.txt'
        @file_invalid = 'cards_invalid.txt'
        @cardset = CardGenerator.new(@file)
        @deck = Deck.new(@cardset)
    end

    it 'exists' do
        expect(@cardset).to be_instance_of(CardGenerator)
    end

    it 'makes cards correctly' do
        card_reader = []
        file_reader = []
        @cardset.temp_deck.each do |card|
            card_reader << "#{card.question},#{card.answer},#{card.category.to_s.tr(':','').tr('_',' ')}"
        end
        File.foreach(@file) do |line|
            file_reader << line.tr("\n",'')
        end
        expect(card_reader).to eq(file_reader)
    end

    it 'catches invalid input' do
        expect(CardGenerator.new(@file_invalid)).to output("\n\n\n~~~Answer passed in cannot be the phrase 'arbitrarily wrong', see #{@file_invalid} for source.~~~\n\n\n").to_stderr
    end
end



