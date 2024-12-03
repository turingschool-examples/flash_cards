require 'rspec'
require './lib/card'
require './lib/deck'

describe Deck do
    it 'exists' do
        deck = Deck.new

        expect(deck).to be_a(Deck)
    end
end