require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

describe Round do
    it 'exists' do
        round = Round.new

        expect(round).to be_a(Round)
    end
end