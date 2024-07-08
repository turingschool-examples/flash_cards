require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Round do 
    before(:each) do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card_1, @card_2, @card_3])
        @round = Round.new(@deck)
    end

    it 'exists' do
        expect(@round).to be_instance_of(Round)
    end

    it 'has a deck' do
        expect(@round.deck).to eq(@deck)
    end     

    it 'has turns' do
        expect(@round.turns).to eq([])
    end 

    it "has a current card" do
        expect(@round.current_card).to eq(@card_1) 
    end

    it 'takes a new turn' do
        new_turn = @round.take_turn("Juneau")
        expect(new_turn).to be_an_instance_of(Turn)
        expect(new_turn.guess).to eq("Juneau")
        expect(new_turn.card).to eq(@card_1)
        new_turn = @round.take_turn("Mars")
        expect(new_turn.guess).to eq("Mars")
        expect(new_turn.card).to eq(@card_2)
        # expect(@round.take_turn("Juneau")).to match(Turn.new("Juneau", @card_1))
    end
end