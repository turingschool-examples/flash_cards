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
        @card_4 = Card.new("What is the imaginary horizontal line that goes around the middle of the earth?", "Equator", :Geography)
        @deck = Deck.new([@card_1, @card_2, @card_3])
        @round = Round.new(@deck)
    end

    it 'exists and has attributes' do
        expect(@round).to be_instance_of(Round)
        expect(@round.deck).to eq(@deck)
    end

    it 'can have a turns array that is empty on default' do
        expect(@round.turns).to eq([])
    end

    it 'can tell you the current card from the deck' do
        expect(@round.current_card).to eq(@card_1)
        @round.take_turn("Juneau")
        expect(@round.current_card).to eq(@card_2)
        @round.take_turn("Venus")
        expect(@round.current_card).to eq(@card_3)
        expect(@round.current_card.category).to eq(:STEM)
    end

    it 'can take turns' do
       
        turn = Turn.new("Juneau", @card_1)
        expect(@round.turns.length).to eq(0)
        new_turn = @round.take_turn("Juneau")
        expect(@round.turns.length).to eq(1)
        expect(@round.turns[0]).to be_instance_of(Turn)
        @round.take_turn("Venus")
        expect(@round.turns.count).to eq(2)
    end

    it 'can tell you the last turn feedback' do
        turn = Turn.new("Juneau", @card_1)
        new_turn = @round.take_turn("Juneau")
        @round.take_turn("Venus")
        expect(@round.turns.count).to eq(2)
        expect(@round.turns.last.feedback).to eq("I'm sorry your answer is incorrect.")
    end

     it 'can tell you number of correct guesses' do
        @round.take_turn("Juneau")
        expect(@round.number_correct).to eq(1)
        @round.take_turn("Mars")
        expect(@round.number_correct).to eq(2)
        @round.take_turn("Venus")
        expect(@round.number_correct).to eq(2)
    end

    it 'can show number correct by category' do
        @round.take_turn("Juneau")
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        @round.take_turn("Venus")
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end

    it 'can show the percentage correct' do
        @round.take_turn("Juneau")
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        @round.take_turn("Venus")
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
        expect(@round.percent_correct).to eq(50.0)
    end

    it 'can show the percent correct by category' do
        @round.take_turn("Juneau")
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        @round.take_turn("Venus")
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
        expect(@round.percent_correct_by_category(:STEM)).to eq(0.0)
    end

end