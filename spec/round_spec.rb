require 'RSpec'
require './lib/card'
require './lib/deck'
require './lib/round'

describe Round do
  describe '#initialize' do
    round = Round.new(deck)
    it 'is a round' do
     expect(round).to be_instance_of(Round)
    end
  end
end
