require 'rspec'
require './lib/turn.rb'

describe Turn do
  describe 'initialize' do
    it 'is an instance of turn' do
      turn1 = Turn.new
      expect(turn1).to be_a Turn
    end
  end
end 
