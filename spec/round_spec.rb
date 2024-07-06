require 'rspec'
require './lib/round'

RSpec.configure do |config|
    config.formatter = :documentation
    end


RSpec.configure 'round' do
    it 'should exist' do
        round = Round.new(deck)

        expect(round).to be_instance_of Round
    end
end