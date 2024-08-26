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
       
    it 'has a Round' do #testing if the Round class exists and if it contains the deck
        expect(@round).to be_an_instance_of(Round)
        expect(@round.deck).to eq(@deck)
    end

    it 'has turns' do 
        expect(@round.deck).to be_an_instance_of(Deck) #is rounds.deck an instance of deck?
        expect(@round.deck).to eq(@deck)
       end

    it 'has an empty array' do
        expect(@round.turns).to eq([]) #is rounds.turn an empty array?
    end

    it 'Start with first card in deck as current' do      
        expect(@round.current_card).to eq(@card_1) #is the firt card in current_card card_1?
    end

    it 'Testing Taking a Turn' do
        new_turn = @round.take_turn("Juneau") #within the .take_turn instance. With Juneau as the ,guess, 
        expect(new_turn).to be_an_instance_of(Turn)
        expect(@round.turns).to eq([new_turn])
    end

    it 'counts the number correct'do
        @round.take_turn("Juneau") #my first guess is going to be Juneau. My take_turn method, within my Round class, encompasses my number_correct instance. With this, my guess should be correct
        expect(@round.number_correct).to eq(1)
end

    it 'updates current card to the next card in the deck' do
        @round.take_turn("Juneau") #Taking my first card. Take_turn method contains contains instance of .current_card. 
        expect(@round.current_card).to eq(@card_2)
    end

    it 'Takes new Turn/Feedback' do
        @round.take_turn("Juneau") #Taking a turn and guess
        @round.take_turn("Venus") #Taking a turn and guess
        expect(@round.turns.count).to eq(2) #my .turns now has two instances of cards. My .count method counts how many "turns" are within my turns array
        expect(@round.turns.last.feedback).to eq("Incorrect.") #my .last is accessing the last object within the turns array, then accessing the feedback instance within my Turns Class.
        expect(@round.number_correct).to eq(1) #Using my .number_correct method, I am able to calculate that within the two answers provided, the amount correct = 1
    end

    it 'number correct by category' do
        @round.take_turn("Juneau") #Take a turn, Juneau as guess
        @round.take_turn("Planet") #Take a turn, Planet is guess
        expect(@round.number_correct_by_category(:Geography)).to eq(1) #Based on my category associated in my Card class, we can determine if the guess is correct, access the category, and +1 to how many are correct
        expect(@round.number_correct_by_category(:STEM)).to eq(0)
    end
    
    it 'Percent Complete' do
        @round.take_turn("Juneau") 
        @round.take_turn("Starlord")
        expect(@round.percent_correct).to eq(50.0) #See comments in percent complete method
    end

    it 'Count Percent Correct by Category' do
        @round.take_turn("Juneau")
        expect(@round.percent_correct_by_category(:Geography)).to eq(100.0) #See comments in .percent_correcet_by_category method
    end
    
    it 'Shows the final card' do
        @round.take_turn("Jeans")
        @round.take_turn("Mars")
        expect(@round.current_card).to eq(@card_3) #After two turns, we want to determine that the current card method has commanded to count that we are now on the third card in the deck of cards of 3
    end
end
