require 'rspec'
require './lib/turn.rb'


describe Turn do
  describe 'argument' do
    it 'is initialized with two arguments' do
      turn1 = Turn.new("Junea", "Placeholder for current card")
      expect(turn1.guess).to eq("Junea")
      expect(turn1.card).to eq("Placeholder for current card")
    end
  end
end
