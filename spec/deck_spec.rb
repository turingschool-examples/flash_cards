require 'rspec'
require './lib/turn'
require './lib/card'

describe Deck do
    describe '#initialize' do
        it 'is an instance of deck' do
        
            deck = Deck.new
            expect(deck).to be_instance_of(Deck)
        end
        it 'has cards'
    end
end