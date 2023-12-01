require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    before(:each) do
        #setup for tests below
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @deck = Deck.new([@card_1, @card_2, @card_3])
        @round = Round.new(@deck)
    end

    it 'exists' do
        expect(@round).to be_an_instance_of Round
    end

    it 'stores a deck' do 
        expect(@round.deck).to eq (@deck)
    end

    it 'starts with no turns' do
        expect(@round.turns).to eq([])
    end

    it 'returns the correct card being played' do
        expect(@round.current_card).to eq (@card_1)
    end

    it 'stores the guess in the new Turn object' do
       new_turn = @round.take_turn("Juneau")
        
        expect(new_turn).to eq (["Juneau", @card_1])
    end
    
    # xit 'move on to the next card in the deck' do
    #     new_turn = @round.take_turn("Juneau")

    #     expect(@round.current_card).to eq (@card_2)
        
    #     @round.take_turn("z")
    #     expect(@round.current_card).to eq (@card_3)

    # end
end