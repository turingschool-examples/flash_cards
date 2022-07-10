require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'
#require 'pry'; binding.pry

RSpec.describe Round do

    before do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1], [@card_2], [@card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
       # @new_turn = @round.take_turn("Juneau") #possible insert individually below
    end


    it 'exists in round' do
        expect(@round.deck).to eq(@deck)
    end

    it 'returns array' do
         expect(@round.turns).to match([])
    end

    it 'current card should exist' do
         expect(@round.current_card).to eq([@card_1])
    end
    #STUCK HERE
    xit 'turn offerd' do
        #new_turn = round.take_turn("Juneau")
        expect(@round.take_turn("Juneau")).to be_instance_of(Round)
    end
    
    xit 'turn recorded' do
        @round.take_turn("Juneau")
        expect(@new_turn.class).to eq(Turn)
    end
    
    xit 'determines if true' do
        @round.take_turn("Juneau")
        expect(@new_turn.correct?).to be true
    end
    
    xit 'exists as a turn' do
        @round.take_turn("Juneau")
        expect(@round.turns).to be_instance_of(Round) #.to eq ([new_turn])
    end
    
    xit 'determines score' do
        @round.take_turn("Juneau")
        expect(@round.number_correct).to be(1)
    end
    
    xit 'gears up next card' do
        expect(@round.current_card).to eq([@card_2])
    end
    
    xit 'turn offered' do
        expect(@round.take_turn("Venus")).to be_instance_of(Round)
    end
    
    xit 'determines number of turns' do
        expect(@round.turns.count).to eq(2)
    end
    
    xit 'determines if true' do
        expect(@round.turns.last.feedback).to eq("Incorrect.")
    end
    
    xit 'determines score' do
        expect(@round.number_correct).to eq(1)
    end
    
    xit 'determines score by geography' do
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
    end
    
    xit 'determines score by STEM' do
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end
    
    xit 'determines percent correct' do
        expect(@round.percent_correct).to eq(50.00)
    end
    
    xit 'determines score by geography' do
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.00)
    end
    
    xit 'gears up next card' do
        expect(@round.current_card).to eq([@card_3])
    end
    
end
