require './lib/turn'
require './lib/card'
require 'pry'

RSpec.describe Turn do
    before(:each) do
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @turn = Turn.new("Saturn", @card)
    end

    it "exists" do
        expect(@turn).to be_instance_of(Turn)
    end
end