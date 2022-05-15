require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

RSpec.describe Round do
    before :each do
        @filename = File.read("cards.txt").split(",")
        @cards = CardGenerator.new(@filename)#.cards ----- what is .cards?!
    end

    it 'exists' do
        expect(@cards).to be_a CardGenerator
    end

    it 'has a filename' do
        expect(@cards.output).to be_a Array
    end

end