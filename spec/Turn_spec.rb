require './lib/Turn'
require './lib/card'

RSpec.describe Turn do
    it 'exists' do
        #card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", @card)
        expect(turn).to be_instance_of(Turn)
    end

    it 'takes a guess' do
        turn = Turn.new("Juneau", @card)
        expect(turn.guess).to eq true
    end

    it "is a card" do
        turn = Turn.new("Juneau", @card)
        expect(turn.card).to be_instance_of(Card)
    end
end

   