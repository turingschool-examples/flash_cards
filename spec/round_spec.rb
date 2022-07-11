require './lib/round'
require './lib/deck'
require './lib/turn'
require './lib/card'
require 'pry'; #binding.pry

RSpec.describe Round do

    before do
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)
        @round = Round.new(@deck)
    end

    it 'exists in round' do
        expect(@round.deck).to eq(@deck)
    end

    it 'returns array' do
         expect(@round.turns).to match([])
    end

    it 'current card should exist' do
         expect(@round.current_card).to eq(@card_1)
    end
    
    it 'turn recorded' do
        new_turn = @round.take_turn("Juneau")
        expect(@round.take_turn("Juneau")).to be_instance_of(Turn)
    end
    
    it 'turn recorded' do
        new_turn = @round.take_turn("Juneau")
        expect(new_turn.class).to eq(Turn)
    end
    
    it 'determines if true' do
        new_turn = @round.take_turn("Juneau")
        expect(new_turn.correct?).to eq(true)
    end
    
    it 'exists as a turn' do
        new_turn = @round.take_turn("Juneau")
        expect(@round.turns).to eq([new_turn])
    end
    
    it 'determines score' do
        new_turn = @round.take_turn("Juneau")
        expect(@round.number_correct).to be(1)
    end

    it 'exists' do 
        new_turn = @round.take_turn("Mars")
        expect(@round.current_card).to eq(@card_1)
    end
    
    it 'turn offered' do
        expect(@round.take_turn("Venus")).to be_instance_of(Turn)
    end
    
    it 'determines number of turns' do
        new_turn_2 = @round.take_turn("Venus")
        new_turn_3 = @round.take_turn("Abdul")
        expect(@round.turns.count).to eq(2)
    end
    
    it 'determines if true' do
        new_turn_2 = @round.take_turn("Venus")
        expect(@round.turns.last.feedback).to eq("Incorrect.")
    end
    
    it 'determines score' do
        new_turn_2 = @round.take_turn("Juneau")
        expect(@round.number_correct).to eq(1)
        
    end
    
    xit 'determines score by catageory' do
        new_turn = @round.take_turn("Juneau")
        new_turn_2 = @round.take_turn("Venus")
        
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end
    
    xit 'determines percent correct' do
        expect(@round.percent_correct).to eq(50.00)
    end
    
    xit 'determines score by geography' do
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.00)
    end
    
    xit 'gears up next card' do
        expect(@round.current_card).to eq(@card_3)
    end
    
end
