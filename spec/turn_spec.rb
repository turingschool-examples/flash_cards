require './lib/card'
require './lib/turn'
require 'pry'

describe Turn do
  describe '#new' do
    it "exists" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)

      expect(turn).to be_a(Turn)
    end
  end 

end
