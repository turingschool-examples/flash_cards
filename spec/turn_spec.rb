require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
    it "initializes with guess and card" do
        turn = Turn.new("Juneau", card)
        expect(turn.guess).to eq "Juneau"
        expect(turn.card).to eq card
      end
    end 
