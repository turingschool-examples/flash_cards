require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    #Danielle was kind enough to share this introduction to the test below.
    #Rather than having to repeat each instance, this allows each test to instantiate the card(s) and deck
    before(:each) do
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography) #info given for card 1 while creating a new flashcard
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      @cards  = [@card_1, @card_2, @card_3] #creating a cards object that contains all info from cards 1/2/3
      @deck   = Deck.new(@cards) #instantiating a new deck
      @round  = Round.new(@deck) #instantiating a new round - as to not repeat any information gained from previous
    end
      
    it 'has a Round' do
        expect(@round).to be_an_instance_of(Round)
        expect(@round.deck).to eq(@deck)
    end

    it 'has turns' do 
        expect(@rounds.deck).to be_an_instance_of(Round)
        expect(@round.deck).to eq(@deck)
        expect(@round.turns).to eq([])
    end

    it 'has an empty array' do
        expect(@rounds.turn).to eq([])
    end

    it 'Start with first card in deck as current' do      
        expect(@round.current_card).to eq(@card_1)
    end

    it 'Testing Taking a Turn' do
        new_turn = @round.take_turn("Juneau")
        expect(new_turn_turn).to be_an_instance_of(Turn)
        expect(@round.turns).to eq([new_turn])
    end

    it 'counts the number correct'do
        @round.take_turn("Juneau")
        expect(@round.correct?).to eq true
        expect(@round.number_correct).to eq(1)
end

    it 'updates current card to the next card in the deck' do
        @round.take_turn("Juneau")
        expect(@round.current_card).to eq(card_2)
    end

    it 'Takes new Turn/Feedback' do
        @round.take_turn("Juneau")
        @round.take_turn("Venus")
        expect(@round.turns.count).to eq(2)
        expect(@round.turns.last.feedback).to eq("Incorrect.")
        expect(@round.number_correct).to eq(1)
    end

    it 'number correct by category' do
        @round.take_turn("Juneau")
        @round.take_turn("Planet")
        expect(@round.number_correct_by_category(:Geography)).to eq(1)
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end
    
    it 'Percent Complete' do
        expect(@round.percent_correct).to eq(50.0)
    end

    it 'Count Percent Correct by Category' do
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    end
    
    it 'Shows the final card'
        @round.take_turn("Jeans")
        @round.take_turn("Mars")
        expect(@round.current_card).to eq(@card_3)
end


end
