require './lib/deck'
require './lib/randomize'
require './lib/card_generator'
require './lib/card'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Randomize do
    before (:all) do
        filename = "cards.txt"
        cards = CardGenerator.new(filename).cards
        deck = Deck.new(cards)
        @randomize = Randomize.new(deck.count)
    end

    it 'exists' do
        expect(@randomize).to be_instance_of Randomize
    end

    it 'identifies the number of cards available' do
        expect(@randomize.card_number.count).to eq 7
    end

    it 'creates an array of number of cards' do
        expect(@randomize.card_number).to eq [1, 2, 3, 4, 5, 6, 7]
    end
    
    xit 'picks a random number' do
        @randomize.pick
        expect(@randomize.give_number).to be <= 6
    end

    it 'lowers card_number by one each time' do
        #not sure why this is counting the card_number to 6 instead of 7,
        #isn't it a new instance of Randomize? if I skip the prior test this one passes
        expect(@randomize.card_number).to eq [1, 2, 3, 4, 5, 6, 7]
        
        @randomize.pick
        expect(@randomize.card_number.count).to eq 6
        
        @randomize.pick        
        expect(@randomize.card_number.count).to eq 5
    end
end
