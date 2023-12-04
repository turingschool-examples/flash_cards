require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/start.rb'
require 'pry'

RSpec.describe do
    it 'exists' do
        start = Start.new

        expect(start).to be_a(Start)
    end
end