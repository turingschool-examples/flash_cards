require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    before :each do
        @turn = Turn.new("Juneau", @card)
        @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    end

    it 'exists' do
        expect(@turn).to be_a(Turn)
    end
end