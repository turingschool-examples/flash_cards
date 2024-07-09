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
        @randomize = Randomize.new(deck)
    end

    it 'exists' do
        expect(@randomize).to be_instance_of Randomize
    end

    it 'identifies the number of cards available' do
        expect(@randomize.card_amount).to eq 7
    end

    it 'picks a random number' do
        expect(@randomize.pick).to be <= 6
    end

    it 'lowers card_amount by one each time' do
        #not sure why this is counting the card_amount to 6 instead of 7,
        #isn't it a new instance of Random?
        expect(@randomize.card_amount).to eq 6
        
        @randomize.pick
        expect(@randomize.card_amount).to eq 5
        
        @randomize.pick        
        expect(@randomize.card_amount).to eq 4
    end
end
